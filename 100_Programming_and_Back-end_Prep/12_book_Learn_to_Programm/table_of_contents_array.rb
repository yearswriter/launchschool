table_width=0
table = [["Chapter 1: Getting Started", "page  1"],
        ["Chapter 2: Numbers",          "page  9"],
        ["Chapter 3: Letters",          "page 13"]]
table.each {|ch,pg| table_width=ch.length if table_width<=ch.length}  
puts "Tab space for formatting: "
space_width = gets.chomp.to_i
puts 
unless space_width >= 0 
  puts "Tab space should be positive!"
  return
end
table_width+=space_width
table.each do|ch,pg|
  print ch.ljust(table_width)
  puts pg.rjust(table_width)
end