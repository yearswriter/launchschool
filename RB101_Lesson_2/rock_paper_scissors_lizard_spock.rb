CHOOSE = %w(rock scissors paper lizard spock)

def humanized_choice_array
  choices = CHOOSE.map do |c|
    result = c.chars.unshift('(')
    if c.start_with?('sp')
      result.insert(3, ')')
    else
      result.insert(2, ')')
    end
    result.join
  end
  choices.join(', ')
end

def validate(choice)
  if choice.empty?
    print "Empty input!"
    return promt_for_choice
  end
  validated_choice = CHOOSE.find do |x|
    x.start_with?(x == choice || choice[/(^[A-z]{2})|(^[A-z])/])
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

def game_result(player_a, player_b)
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
  puts "First player chooses: " + human
  puts "Second player chooses: " + pc
  puts game_result(human, pc)
  puts "Do you want to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Goodbye!"
