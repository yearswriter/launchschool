require 'yaml'
CONFIG    = YAML.load_file('calculator_messages.yml')
MESSAGES  = {}
OPERATORS = {}
def promt(message)
  Kernel.puts(">> #{message}")
end

def valid_number?(number)
  /^\d+\.*\d*$/.match(number)
end

loop do
  promt("Choose locale (ru/en):")
  locale = gets.chomp
  if CONFIG[locale]
    MESSAGES  = CONFIG[locale]['promts']
    OPERATORS = CONFIG[locale]['operators']
    break
  else
    promt("Wrong locale! It can be 'ru' or 'en' !")
  end
end

number1 = ''
number2 = ''
operator = ''

promt(MESSAGES['welcome'])
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    promt(MESSAGES['enter_name'])
  else
    break
  end
end

promt(MESSAGES['hi'] + name)

loop do # main loop
  loop do
    promt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      promt(MESSAGES['valid_number'])
    end
  end

  loop do
    promt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      promt(MESSAGES['valid_number'])
    end
  end

  promt(MESSAGES['operator_promt'])

  loop do
    operator = Kernel.gets().chomp()

    if %w(* / + -).include?(operator)
      break
    else
      promt(MESSAGES['short_operator_promt'])
    end
  end

  promt("#{OPERATORS[operator]} #{number1} and #{number2}")

  answer = case operator
           when '*'
             number1.to_i() * number2.to_i()
           when '/'
             if number2.to_f() != 0
               number1.to_f() / number2.to_f()
             else
               MESSAGES['by_zero']
             end
           when '+'
             number1.to_i() + number2.to_i()
           when '-'
             number1.to_i() - number2.to_i()
           end

  promt(MESSAGES['answer'] + answer.to_s)
  promt(MESSAGES['try_again'])
  break unless Kernel.gets().chomp().downcase().include?("y")
end

promt(name + MESSAGES['bye'])
