def promt(message)
  puts(">> #{message}")
end

def integer?(number)
  /^\d+$/.match(number) && true
end

def float?(number)
  /^(\d)|(\d*\.?\d*)$/.match(number) && true
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def operation_to_message(operator)
  case operator
  when '+'
    'Adding'
  when '-'
    'Substracting'
  when '*'
    'Multiplying'
  when '/'
    'Dividing'
  end
end

operator_promt = <<~OP_MSG
  What operation would you like to perform?
      Input * to multiply;
      Input / to divide;
      Input + to add;
      Input - to substract.
OP_MSG
number1 = ''
number2 = ''
operator = ''

promt("Welcome to Calculator! Enter your name: ")
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    promt("Make sure to enter name.")
  else
    break
  end
end

promt("Hi, #{name}")

loop do # main loop
  loop do
    promt("What is the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      promt("Error! Not a valid number!")
    end
  end

  loop do
    promt("What is the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      promt("Error! Not a valid number!")
    end
  end

  promt(operator_promt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(* / + -).include?(operator)
      break
    else
      promt("Must choose * , / , - or +")
    end
  end

  promt("#{operation_to_message(operator)} #{number1} and #{number2}")

  answer = case operator
           when '*'
             number1.to_i() * number2.to_i()
           when '/'
             if number2.to_f() != 0
               number1.to_f() / number2.to_f()
             else
               "Error! Cannot divide by zero!"
             end
           when '+'
             number1.to_i() + number2.to_i()
           when '-'
             number1.to_i() - number2.to_i()
           else
             "Must choose * , / , - or +"
           end
  promt("Answer is: #{answer}")
  promt("Do you want to performe another calculation?")
  break unless Kernel.gets().chomp().downcase().include?("y")
end

promt("Goodbye!")
