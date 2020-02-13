require 'yaml'
# Drawing method + loading default tileset from config
def draw_tile!(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][0]
  col = CONFIG['address_table']['cols'][col][0]
  board['tileset'][row][col] = value
  board['tileset']
end

# Filling turn data method + loading default tileset from config
def fill_turn!(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][1]
  col = CONFIG['address_table']['cols'][col][1]
  board['player_turns'][row][col] = value
  board['player_turns']
end

# Checking if tile still empty
# rubocop:disable Metrics/AbcSize
def empty?(board, row, col)
  rows = CONFIG['address_table']['rows']
  cols = CONFIG['address_table']['cols']

  tileset      = board['tileset']
  player_turns = board['player_turns']

  trow = rows[row][0]
  tcol = cols[col][0]

  row = rows[row][1]
  col = cols[col][1]

  tileset[trow][tcol].eql?(' ') || player_turns[row][col].zero?
end

# rubocop:enable Metrics/AbcSize
# Checking if there any empty places on whole board
def untill_end?(board)
  board['player_turns'].flatten.select(&:zero?)
end

# searching for winner lines
def winner_lines?(board, player)
  player_turns = board['player_turns']

  cols = player_turns.map do |row|
    row.reduce { |acc, val| val if val == acc }
  end.include?(player)

  rows = player_turns.transpose.map do |row|
    row.reduce { |acc, val| val if val == acc }
  end.include?(player)

  cols || rows
end

# searching for winner diagonals
def winner_dgnls?(board, player)
  lr = board['player_turns'].to_s.match?(
    /^\[\[#{player}, \d, \d\], \[\d, #{player}, \d\], \[\d, \d, #{player}\]\]$/
  )
  rl = board['player_turns'].to_s.match?(
    /^\[\[\d, \d, #{player}\], \[\d, #{player}, \d\], \[#{player}, \d, \d\]\]$/
  )
  lr || rl
end

def win?(board, player)
  winner_lines?(board, player) || winner_dgnls?(board, player)
end

# rubocop:disable Metrics/AbcSize
def computer_turn!(board, player, sign)
  row = CONFIG['address_table']['rows'].keys.sample
  col = CONFIG['address_table']['cols'].keys.sample
  until empty?(board, row, col)
    row = CONFIG['address_table']['rows'].keys.sample
    col = CONFIG['address_table']['cols'].keys.sample
  end
  fill_turn!(board, row, col, player)
  draw_tile!(board, row, col, sign)
end

# rubocop:enable Metrics/AbcSize

# A standart turn method
# this one is indeed not pretty
def turn!(board, player)
  system 'cls'
  # rubocop:disable Metrics/LineLength
  # I mean it is an OK line
  puts "|> Input Player##{player} turn: '|> row col' (left\\right\\top\\bot\\mid)"
  # rubocop:enable Metrics/LineLength
  puts board['tileset']
  print "|> "

  # actual turn
  case player
  when 1
    answer = gets.chomp
    answer = answer.split(' ')
    # input checks
    return 'Wrong input' if answer.empty?
    return 'Wrong input' unless answer[0].match?(/top|bot|mid/)
    return 'Wrong input' unless answer[1].match?(/left|right|mid/)
    return 'Cell is taken' unless empty?(board, *answer)

    fill_turn!(board, *answer, player)
    draw_tile!(board, *answer, 'X')
  when 2
    computer_turn!(board, player, 'O')
  else
    return 'No such player ID'
  end
  #-------------
  puts board['tileset']
  # win condition checks
  if win?(board, player)
    return player
  elsif untill_end?(board).nil?
    return 'Draw'
  end
  #---------------------
end

# main game loop
loop do
  CONFIG = YAML.load_file('./config.yml')
  board =  CONFIG['board']
  game = [1, 2]
  system 'cls'
  puts 'player sign is an "X"'
  puts 'Choose you go first or second:'
  puts '1 or 2'
  case gets.chomp
  when '1'
    game = [1, 2]
  when '2'
    game = [2, 1]
  else
    return puts "Wrong answer"
  end
  game.cycle do |player|
    turn = turn!(board, player)
    case turn
    when 'Wrong input'
      puts 'Wrong input'
      redo
    when 'Cell is taken'
      puts 'Cell is taken'
      redo
    when 1..2
      puts "Player №#{player} WON!"
      break
    when 'Draw'
      puts 'IT\'S A TIE!'
      break
    end
  end
  puts '|another game?|(y\n)'
  return unless gets.chomp == 'y'
end
