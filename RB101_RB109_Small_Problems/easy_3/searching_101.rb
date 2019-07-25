def promt(order,output)
  puts "==> Enter the #{order + 1} number:"
  output << gets.chomp.to_i
end

input_array = []

5.times { |order| promt(order,input_array)}

puts "==> Enter the last number:"
output = 0
output = gets.chomp.to_i

p !!input_array.include?(output) ?  "The number #{output} appears in #{input_array}." : "The number #{output} does not appear in #{input_array}."
