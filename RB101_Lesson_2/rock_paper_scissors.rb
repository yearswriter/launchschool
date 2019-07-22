CHOOSE = ['rock', 'scissors', 'paper']

def humanized_choice_array
  choices = CHOOSE.map do |c|
    c.chars.unshift('(').insert(2, ')').join
  end
  choices.join(', ')
end

def validate(choice)
  validated_choice = CHOOSE.find do |x|
    x.start_with?(choice[/^[A-z]/] || x == choice)
  end
  if validated_choice.nil?
    print "Wrong input! "
    return promt_for_choice
  end
  validated_choice
end

def promt_for_choice
  print "Choose #{humanized_choice_array()}: "
  choice = gets.chomp.downcase
  validate(choice)
end

def make_choice
  CHOOSE.sample
end

def show_winner(player_a, player_b)
  puts "First player chooses: " + player_a
  puts "Second player chooses: " + player_b
  a_weight = CHOOSE.index(player_a)
  b_weight = CHOOSE.index(player_b)
  if a_weight == b_weight
    "Draw"
  elsif a_weight == b_weight - 1
    "First player won!"
  else
    "Second player won!"
  end
end

loop do
  human = promt_for_choice
  pc = make_choice
  puts show_winner(human, pc)
  puts "Do you want to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
