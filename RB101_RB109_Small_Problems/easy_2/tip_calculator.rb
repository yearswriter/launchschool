print "What is the bill? $"
bill = gets.chomp.to_f
print "What is the tip percentage? %"
tip_percentage  = gets.chomp.to_f / 100
tip = bill * tip_percentage
puts "The tip is $#{tip.round(2)}"
puts "The total is $#{bill.round(2)+tip.round(2)}"
