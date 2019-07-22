CHOOSE = ['rock', 'scissors', 'paper']

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
  print "Choose (r)ock, (p)aper or (s)cissors: "
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

human = promt_for_choice
pc = make_choice

puts show_winner(human, pc)
