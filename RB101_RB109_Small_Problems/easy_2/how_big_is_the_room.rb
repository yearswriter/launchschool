FEET_IN_METERS = 10.7639
print "Enter the length of the room in meters: "
length = gets.chomp.to_f
print "Enter the width of the room in meters: "
width = gets.chomp.to_f
area = length * width
puts "The area of the room is #{area.round(0)} square meters (#{(area * FEET_IN_METERS).round(2)} square feet)."
