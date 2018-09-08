print "What is your full name? "
full_name = gets.chomp.split(" ")
if full_name.length<1
  puts "Hey, why so silent :("
  return
elsif full_name.length==1
  puts "Woa! That is a long name!" if full_name[1].to_s.length>9
elsif full_name.length>3
  puts "Wow! You've got a lot of names!"
end
full_name_length=0
full_name.each {|name| full_name_length+=name.length}  
print "Greetings, "
full_name.each {|name| print "#{name.capitalize} "}
puts "!\nDid you know there are #{full_name_length} characters in your name?" 
 
