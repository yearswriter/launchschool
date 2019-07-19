require 'yaml'

CONFIG      = YAML.load_file('loan_calc_config.yml')
TARIFS      = CONFIG['tarifs']
ID_METHODS  = CONFIG['id_methods']
PROMTS      = CONFIG['promts']
NAME = "LONLGOOGNGONGNEMAR"

def quit()
  puts PROMTS['confirm_quit']
  if gets.chomp.downcase.include?("y")
    bye = sprintf(
      "#{PROMTS['top_line']}|#{PROMTS['bye']}%-32s|\n#{PROMTS['bot_line']}", NAME.downcase.capitalize + "!")
    puts bye
    true
  else
    puts PROMTS['help']
    false
  end
end

def list_tarifs
  TARIFS.each do |tarif_name,tarif_parameters|
    puts "Tarif name (c): " + tarif_name.to_s
    puts sprintf("APR: %+8s%%",tarif_parameters['apr']*100)
    puts sprintf("Mimimum loan amount: %+8s$",tarif_parameters['min_loan'])
    puts sprintf("Maximum loan amount: %+8s$",tarif_parameters['max_loand'])
    puts sprintf("APR: %+8s months",tarif_parameters['max_duration']*12)
  end
  return false
end

def resque_user(input)
  case input
  when 's'
    puts "call tarif selection method"
  when 'l'
    list_tarifs
  when 'h'
    puts PROMTS['help']
  when 'c'
    puts "print current configuration"
  when 'q'
    quit()
  else
    puts PROMTS['invalid_answer']
  end
end

puts PROMTS['hi']
puts PROMTS['help']
loop do # main loop
  input = gets.chomp
  if resque_user(input)
    sprintf "#{PROMTS['top_line']}\n|#{PROMTS['bye']}%-41s|\n#{PROMTS['bot_line']}", "NAME!"
    break
  end
end
=begin
  General plan:
  Make config with 3 different (named) tarif plans for loans
   - with paramters:
    #Annual Percentage Rate (APR is expressed as a percentage
     that represents the actual yearly cost of funds over the term of a loan)
    #aviable loan duration
    #aviable loan amount
  Make config with 3 different methods of identification:
    - by Name, Family name, and phone
    - by Name, Family name, and email
    - by Name, Family name, and post number
    Store regex string in config for phone|email|id use Regexp.new
    Validate input:
     - Name, Family: not empty, only A-z
     - phone: /^\+\d+\(\d{3}\)\d{3}-\d{2}-\d{2}$/
     - email: /(\d*[A-z]*\d*\.)*(\d*[A-z]*\d*)+@()\d*[A-z]\d*)+\.[a-z][a-z]+/
     - id: /^\d{8}/
   Greet User, Ask for Name, Family name
   and for one of id fields, check id with regexp id in a loop with validations
      calculate monthly interest rate:
      Present user with tarif plans and ask to choose
        m = p * (j/(1-(1+j)**(-n)))
        output:
        On your tarif "name" with APR=a,loan amount = p, and loan duration = n,
         your monthly payment will be m, with monthly interes rate of j%
         your total will be: m * 12
         Ask if everything seems right
         if no ask if start over
         if no exit
=end
