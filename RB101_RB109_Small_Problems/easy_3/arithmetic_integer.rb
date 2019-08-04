require 'yaml'

OPERATORS = YAML.load_file('operators.yml')

def promt(string)
  puts "==> #{string}"
end



promt "Enter the first number:"
first_number = gets.chomp.to_i
promt "Enter the second number:"
second_number = gets.chomp.to_i

OPERATORS.map do |operator|
  if second_number.zero? && (operator == '/' || operator == '%')
    promt "Cannot divide by zero (#{first_number} #{operator} #{second_number})"
    next
  end
  if operator == '/'
    first_number = first_number.to_f
  else
    first_number = first_number.to_i
  end
  promt "#{first_number} #{operator} #{second_number} = #{first_number.method(operator).(second_number)}"
end
