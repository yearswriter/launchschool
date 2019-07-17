def is_odd?(number)
  return (number%2)==0 ? false : true
end
print "Enter number: "
puts is_odd?(gets.chomp.to_i)
#----------------from da book
def odd?(number)
  number%2 == 1
end
puts "3 is odd number: #{odd?(3)}"
