print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_at_age = gets.chomp.to_i
retire_at = Time.now.strftime("%Y").to_i + (retire_at_age - age)
puts "It's #{Time.now.strftime("%Y")}. You will retire in #{retire_at}."
puts "You have only #{retire_at - Time.now.strftime("%Y").to_i} years of work to go!"
