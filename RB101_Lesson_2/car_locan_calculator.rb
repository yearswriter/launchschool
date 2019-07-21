require 'yaml'

CONFIG      = YAML.load_file('loan_calc_config.yml')
TARIFS      = CONFIG['tarifs']
ID_METHODS  = CONFIG['id_methods']
PROMTS      = CONFIG['promts']
CURRENT_CONFIG = {}
CURRENT_CONFIG['name']='Stranger'

def quit()
  puts PROMTS['confirm_quit']
  if gets.chomp.downcase.include?("y")
    bye = sprintf(
      "#{PROMTS['top_line']}|#{PROMTS['bye']}%-32s|\n#{PROMTS['bot_line']}",
      CURRENT_CONFIG['name'].to_s + "!")
    puts bye
    true
  else
    puts PROMTS['help']
    false
  end
end

def ask_name
  input=''
  loop do
    puts PROMTS['enter_name']
    input = gets.chomp.downcase.capitalize
    if input.empty?
      puts PROMTS['invalid_answer']
    else
      break
    end
  end
  return input
end

def list_tarifs
  TARIFS.each do |tarif_name,tarif_parameters|
    puts "Tarif name (c): " + tarif_name.to_s
    puts sprintf("APR: %+8s%%",tarif_parameters['apr']*100)
    puts sprintf("Mimimum loan amount: %8d$",tarif_parameters['min_loan'])
    puts sprintf("Maximum loan amount: %8d$",tarif_parameters['max_loan'])
    puts sprintf("APR: %+8s months",tarif_parameters['max_duration']*12)
  end
  false
end

def enter_id
  method = ''
  value  = ''
  loop do
    puts PROMTS['promt_id_method']
    method = gets.chomp.downcase
    if ID_METHODS[method]
      puts "Now enter your #{method} itself."
      value = gets.chomp.downcase
      check = Regexp.new(ID_METHODS[method])
      puts value.match(check)
      break if value.match(check)
    else
      puts PROMTS['invalid_answer']
    end
  end
  return [method,value]
end

def select_tarifs
  tarif={}
  list_tarifs
  loop do
    puts "Enter name of desirable tarif:"
    input = gets.chomp.downcase
    if TARIFS[input]
      tarif = TARIFS[input]
      break
    else
      puts PROMTS['invalid_answer']
    end
  end
  return tarif
end

def ask_summ
  loop do
    puts "#{CURRENT_CONFIG['name']}, please, enter your desireable loan summ:"
    loan = gets.chomp.to_f
    if  loan <= CURRENT_CONFIG['tarif']['max_loan'] && loan >= CURRENT_CONFIG['tarif']['min_loan']
      CURRENT_CONFIG['loan'] = loan
      CURRENT_CONFIG['apr'] = CURRENT_CONFIG['tarif']['apr']
      break
    else
      puts "We are sorry, #{CURRENT_CONFIG['name']}, this summ is not aviable right now for you."
      sleep 3
      correct_tarif= {}
      TARIFS.each {|t| correct_tarif = t[1] if t[1]['max_loan'] >=loan && t[1]['min_loan'] <= loan}
      if correct_tarif && !correct_tarif.empty?
        puts "But it is aviable on this terms:"
        puts correct_tarif
        sleep 3
        puts "Do you wish to take this sum with new tariff?"
        input = gets.chomp.downcase
        if input.start_with?("y")
          CURRENT_CONFIG['tarif'] = correct_tarif
          CURRENT_CONFIG["loan"] = loan
          break
        else
          puts PROMTS['help']
          break
        end
      else
        puts "We do not loan such summs"
        sleep 3
        puts "Please consult aviable tarifs:"
        sleep 1.5
        list_tarifs
      end
    end
  end
  false
end

def process_loan
  CURRENT_CONFIG['name'] = ask_name
  method,value = enter_id
  CURRENT_CONFIG[method] = value
  CURRENT_CONFIG['tarif'] = select_tarifs
  ask_summ
  loan = CURRENT_CONFIG['loan']
  duration = CURRENT_CONFIG['tarif']['max_duration']*12
  apr = CURRENT_CONFIG['tarif']['apr']
  monthly_interest_rate = apr / 12
  monthly_cash = loan / 12
  monthly_interest_cash = monthly_interest_rate * monthly_cash
  monthly_total_cash = loan * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-duration)))
  puts "Congratularions! You were granted #{loan.round(2)}$ loan!"
  puts "For #{duration.to_i} months and #{ (apr * 100).round(2)}% APR"
  puts "Which will be #{(monthly_interest_rate * 100).round(2)}% (#{monthly_interest_cash.round(2)}$) interest per month."
  puts "Which result in #{(loan * apr).round(2)}$ of interest,"
  sleep 2
  puts "For total of #{(loan + (loan * apr)).round(2)}$."
  sleep 0.5
  puts "You can choose to close loan earlier, but with max duration for this tarif it will take"
  puts "#{duration.to_i} months of #{monthly_total_cash.round(2)}$ per month."
  sleep 0.5
  puts "Do not miss your payments, #{CURRENT_CONFIG["name"]}, and have a good day!"
  true
end

def resque_user(input)
  case input
  when 's'
    process_loan
  when 'l'
    list_tarifs
  when 'h'
    puts PROMTS['help']
  when 'c'
    puts CURRENT_CONFIG
  when 'q'
    quit()
  else
    puts PROMTS['invalid_answer']
  end
end

puts PROMTS['hi']
puts PROMTS['help']
loop do # main loop
  input = gets.chomp.downcase
  break if resque_user(input)
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
