print "Tab space for formatting: "
space_width = gets.chomp.to_i
puts
unless space_width>0 
  puts "Tab space should be positive!"
  return
end
table_width = 0
table_of_contents = { "Chapter 1: Getting Started": "page  1",
                      "Chapter 2: Numbers":         "page  9",
                      "Chapter 3: Letters":         "page 13" }
table_of_contents.each {|k,v| table_width = k.to_s.length if table_width<=k.to_s.length}
table_width+=space_width
table_of_contents.each {|chptr,pg| puts chptr.to_s.ljust(table_width) + pg.rjust(table_width)}
=begin
    ;( Cannot figure out how to get string length of the longest key without 
  going through whole hash first time, just for this. And then,
  going again through it, to print.
    (So I could adjust space_width without worrying
  about chapter names that are too long and breaking formatting)
=end