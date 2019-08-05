#--before reading solution
def average(array)
  @sum = 0

  if array.empty?
    return "empty array"
  else
    array.each do |el|
      if el < 0
        return "Negative numbers are not permitted!"
      else
        @sum += el
      end
    end
  end

  @sum / array.length
end

puts average([1, 5, 87, 45, 8, 8])    == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts "----------"
puts average([])                      == "empty array"
puts average([1, 5, -87, 45, 8, 8])   == "Negative numbers are not permitted!"
puts "**********"

#----Ruby way:
# numbers.reduce { |sum, number| sum + number } || numbers.reduce(:+)
def average(array)
  array.reduce(:+).to_f / array.count.to_f if !array.empty?
end
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
puts "----------"
puts average([])
puts average([1, 5, -87, 45, 8, 8])
puts "**********"
puts average([9, 47, 23, 95, 16, 52])\

#---fool proof
def average(array)
  return "empty array" if array.empty?

  @sum = array.reduce do |sum, el|
    return "Negative numbers are not permitted!" if el < 0

    sum + el.to_f
  end
  @sum / array.count
end
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts "----------"
puts average([]) == "empty array"
puts average([1, 5, -87, 45, 8, 8]) == "Negative numbers are not permitted!"
puts "**********"
puts average([9, 47, 23, 95, 16, 52])
