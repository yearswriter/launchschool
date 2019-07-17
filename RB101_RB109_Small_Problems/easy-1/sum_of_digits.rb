def sum(number)
  number.to_s.split('').reduce{|sum,digit| sum.to_i + digit.to_i}
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
puts "-----------------"
#-- I NEED to remember thing with chars and map
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
#---also, yeah this is funny =)) But deprecated! ((
=begin
puts "-----------------"
def sum(number)
  number.digits.sum
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end
