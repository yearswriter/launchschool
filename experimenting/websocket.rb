require 'socket'
require 'digest'
require 'base64'

server = TCPServer.new('localhost', 100)

loop do

  # Wait for a connection
  socket = server.accept
  STDERR.puts "--->Incoming Request\n"

  # Read the HTTP request. We know it's finished when we see a line with nothing but \r\n
  http_request = ""
  while (line = socket.gets) && (line != "\r\n")
    http_request += line 
  end
  STDERR.puts "\n#{http_request}\n"
  
  # Grab the security key from the headers. 
  # If one isn't present, close the connection.
  if matches = http_request.match(/^Sec-WebSocket-Key: (\S+)/)
    websocket_key = matches[1]
    STDERR.puts "^ Websocket handshake detected with key: #{ websocket_key }"
  else
    STDERR.puts "Aborting non-websocket connection"
    socket.close
    next
  end
  
  WS_MAGIC_STRING = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
  digest = Digest::SHA1.digest(websocket_key + WS_MAGIC_STRING)
  response_key=Base64.encode64(digest)
  
  STDERR.puts "<-- Responding to handshake with key: #{ response_key }\n"
  
  socket.write ("HTTP/1.1 101 Switching Protocols\r\n" + 
            "Upgrade: websocket\r\n" + 
            "Connection: Upgrade\r\n" + 
            "Sec-WebSocket-Accept: #{response_key}\r\n")

  STDERR.puts "Handshake completed.Starting to parse the websocket frame."

# Map of the frame for me to remember

# * FIN: <1 bit> If this is false, then the message is split into multiple frames

# * opcode: <4 bits> Tells us if the payload is text, binary, 
#       or if this is just a "ping" to keep the connection alive.

# * RSV: <3 bits> These are unused in the current WebSockets spec.

# * MASK: <1 bit> Boolean flag indicating if the payload is masked.
#       If it's true, then the payload will have to be "unmasked" before use.
#       This should ALWAYS be true for frames coming in from our client. The spec says so.

# * payload length: <7 bits>  If our payload is less than 126 bytes,
#       the length is stored here. If this value is greater than 126, that means
#       more bytes will follow to give us the length. 

# ! Bytes 3-7: The masking key
#       We expect that the payloads of all incoming frames will be masked. 
#       To unmask the content, we will have to XOR it against a masking key.

# ! Bytes 8 and up: The payload

=begin
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-------+-+-------------+-------------------------------+
|F|R|R|R| opcode|M| Payload len |    Extended payload length    |
|I|S|S|S|  (4)  |A|     (7)     |             (16/64)           |
|N|V|V|V|       |S|             |   (if payload len==126/127)   |
| |1|2|3|       |K|             |                               |
+-+-+-+-+-------+-+-------------+ - - - - - - - - - - - - - - - +
|     Extended payload length continued, if payload len == 127  |
+ - - - - - - - - - - - - - - - +-------------------------------+
|                               |Masking-key, if MASK set to 1  |
+-------------------------------+-------------------------------+
| Masking-key (continued)       |          Payload Data         |
+-------------------------------- - - - - - - - - - - - - - - - +
:                     Payload Data continued ...                :
+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
|                     Payload Data continued ...                |
+---------------------------------------------------------------+
=end
  
  
  first_byte = socket.getbyte
  fin = first_byte & 0b10000000 
  opcode = first_byte & 0b00001111

  # Our server will only support single-frame, text messages.
  # Raise an exception if the client tries to send anything else.
  
  raise "We don't support continuations" unless fin
  raise "We only support opcode 1" unless opcode == 1
  
  second_byte = socket.getbyte
  is_masked = second_byte & 0b10000000
  payload_size = second_byte & 0b01111111

  raise "All frames sent to a server should be masked according to the websocket spec" unless is_masked
  raise "We only support payloads < 126 bytes in length" unless payload_size < 126

  STDERR.puts "Payload size: #{ payload_size } bytes"
   
  mask = 4.times.map { socket.getbyte }
  STDERR.puts "Got mask: #{ mask.inspect }"
  
  data = payload_size.times.map { socket.getbyte }
  STDERR.puts "Got masked data: #{ data.inspect }"
  
  unmasked_data = data.each_with_index.map { |byte, i| byte ^ mask[i % 4] }
  STDERR.puts "Unmasked the data: #{ unmasked_data.inspect }"
  
  STDERR.puts "Converted to a string: #{ unmasked_data.pack('C*').force_encoding('utf-8').inspect }"

  response = "Loud and clear!"
  STDERR.puts "Sending response: #{ response.inspect }"

  output = [0b10000001, response.size, response]
  
  socket.write output.pack("CCA#{ response.size }")
  
  socket.close

end  