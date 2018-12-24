puts "Input positive number: "
number=gets.chomp.to_i
puts "Your number is #{number}\n and when I try to assing case return value to variable it works,\n this number is:"
number == case  #curisity, just casing with comparisons didn't work, this works, why?
  when number < 0
    puts "Less then 0"
  when number>=0
    puts "In a range 0-50"
  when number>50
    puts "In a range 51-100"
  when number>100
    puts "More than 100"
  end
puts "\n But just casing variable from input does not work"
puts "Input positive number: "
number=gets.chomp.to_i
case number #probably because rubys minimum comparsion thingy, it sees that 
when (number<0)
  puts "Less then 0"
when (number>=0)
  puts "In a range 0-50"
when (number>50)
  puts "In a range 51-100"
when (number>100)
  puts "More than 100"
end