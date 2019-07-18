print "What is your name? "
name = gets.chomp
hello = "Hello #{name}."
if name.include? "!"
  puts hello.delete("!").upcase + "WHY ARE WE SCREAMING?"
else
  puts hello
end
