CHOOSE = %w(rock paper scissors lizard spock)

WIN_TABLE = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}

score_board = { first_player: 0, second_player: 0 }

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
    x.start_with?(x == choice || choice[/(^[a-zA-Z]{2})|(^[a-zA-Z])/])
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
  if player_a == player_b
    "Draw"
  elsif WIN_TABLE[player_a.to_sym].include?(player_b)
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
  result = game_result(human, pc)
  if result == "First player won!"
    score_board[:first_player] += 1
  elsif result == "Second player won!"
    score_board[:second_player] += 1
  else
    score_board.transform_values! { |score| score + 1 }
  end
  puts result
  score_board.each { |p, s| puts "For #{p} score is: #{s}" }
  puts "Do you want to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Goodbye!"
