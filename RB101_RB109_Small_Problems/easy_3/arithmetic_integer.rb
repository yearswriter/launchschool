def promt(string)
  puts "==> #{string}"
end

operators = ['+','-','*' ,'/' ,'%' ,'**']

promt "Enter the first number:"
first_number = gets.chomp.to_i
promt "Enter the second number:"
second_number = gets.chomp.to_i
operators.map do |operator|
  promt "#{first_number} #{operator} #{second_number} = #{first_number.method(operator).(second_number)}"
end
