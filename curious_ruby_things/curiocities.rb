print "Pleathe enter a thtring: " 
#works:
user_input = gets.chomp.downcase #do not actually need bang, althougn input does not changes, correct valuse is stored
=begin 
also works:
-----
user_input = gets.chomp
user_input.downcase! # do need bang, cause value stored is straight input
-----
does not work at all 
user_input = gets.chomp.downcase! #it probably tries to find pointer to unexisting variable somehwere on lower lever first, to apply downcase to
puts user_input #therefore variable stays empty
=end 
if user_input.include? "s"
  puts user_input.gsub(/s/, "th") #here, we store original input value and only output corrected version. less letters, but need to remember
else print "Nothing to change ~"
end