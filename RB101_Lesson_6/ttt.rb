require 'yaml'
require 'pry'
# Drawing method + loading default tileset from config

# There is a tileset in config (easier to draw), player turns data
# (easier to analize) and addres table that connects them
# general data change method
def set_board_data!(board, row, col, table, value)
  case table
  when 'tileset'
    datatype = 0
  when 'player_turns'
    datatype = 1
  else
    return 'There is no such table in a board'
  end
  row = board['rows'][row][datatype]
  col = board['cols'][col][datatype]
  board[table][row][col] = value
  board[table]
end

def get_board_data(board, row, col, table, _value)
  case table
  when 'tileset'
    datatype = 0
  when 'player_turns'
    datatype = 1
  else
    return 'There is no such table in a board'
  end
  row = board['rows'][row][datatype]
  col = board['cols'][col][datatype]
  board[table][row][col]
end

# just a shorthand for this_exact operation (draw tile)
def draw_tile!(board, row, col, value)
  set_board_data!(board, row, col, 'tileset', value)
end

# just a shorthand for this_exact operation (draw tile)
def fill_turn!(board, row, col, value)
  set_board_data!(board, row, col, 'player_turns', value)
end

# Checking if tile still empty
def empty?(board, row, col)
  tile = get_board_data!(board, row, col, 'tileset')
  turn = get_board_data!(board, row, col, 'player_turns')
  tile.eql?(' ') || turn.zero?
end

# Checking if there any empty places on whole board
def out_of_turns?(board)
  board['player_turns'].flatten.select(&:zero?).empty?
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

def computer_turn!(board, player, sign)
  row = board['rows'].keys.sample
  col = board['cols'].keys.sample
  until empty?(board, row, col)
    row = board['rows'].keys.sample
    col = board['cols'].keys.sample
  end
  fill_turn!(board, row, col, player)
  draw_tile!(board, row, col, sign)
end

# A standart turn method
# this one is indeed not pretty
def turn!(board, player)
  system 'cls'
  # I mean it is an OK line
  puts "|> Input Player##{player} turn: '|> row col' (left\\right\\top\\bot\\mid)"

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
  elsif out_of_turns?(board)
    return 'Tie'
  end
  #---------------------
end

# main game loop
loop do
  board = YAML.load_file('./board.yml')
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
    when 'Tie'
      puts 'IT\'S A TIE!'
      break
    end
  end
  puts '|another game?|(y\n)'
  return unless gets.chomp == 'y'
end
