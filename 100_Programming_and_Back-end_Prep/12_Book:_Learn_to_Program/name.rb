print "What is your full name? "
full_name = gets.chomp.capitalize.split(" ")
if full_name.length<1
  puts "Hey, why so silent :("
  return
elsif full_name.length==1
  puts "Woa! That is a long name!" if full_name[1].to_s.length>9
elsif full_name.length>3
  puts "Wow! You've got a lot of names!"
end
print "Greetings, "
full_name.each {|name| print "#{name} "}
puts "!\nDid I got your name right?" 
 