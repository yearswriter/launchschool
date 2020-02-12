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
  lr = board['player_turns'].eql?([[player, 0, 0],
                                   [0, player, 0],
                                   [0, 0, player]])

  rl = board['player_turns'].eql?([
                                    [0, 0, player],
                                    [0, player, 0],
                                    [player, 0, 0]
                                  ])

  lr || rl
end

# ^ probably most readable and straight forward way to check win
# Conditions, but included all others methods just for training
# general win method
def win?(board, player)
  lines = winner_lines?(board, player)
  dgnl = winner_dgnls?(board, player)
  lines || dgnl
end

# A standart turn method
def turn!(board, player)
  system 'cls'
  puts "|> Input Player##{player} turn: '|> row col' (left\\right\\top\\bot\\mid)"
  puts board['tileset']
  print "|> "
  answer = gets.chomp
  answer = answer.split(' ')
  # input checks
  return 'Wrong input' if answer.empty?
  return 'Wrong input' unless answer[0].match?(/top|bot|mid/)
  return 'Wrong input' unless answer[1].match?(/left|right|mid/)
  return 'Cell is taken' unless empty?(board, answer[0], answer[1])

  # actual turn
  case player
  when 1
    draw_tile!(board, answer[0], answer[1], 'X')
    puts board['tileset']
  when 2
    draw_tile!(board, answer[0], answer[1], 'O')
    puts board['tileset']
  else
    return 'No such player ID'
  end
  fill_turn!(board, answer[0], answer[1], player)
  #-------------
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
  [1, 2].cycle do |player|
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
      puts 'IT\'S A DRAW'
      break
    end
  end
  puts '|another game?|(y\n)'
  return unless gets.chomp == 'y'
end
