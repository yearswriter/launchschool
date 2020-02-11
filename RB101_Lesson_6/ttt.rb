require 'yaml'
CONFIG = YAML.load_file('./config.yml')

# Drawing method + loading default tileset from config
def draw_tile!(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][0]
  col = CONFIG['address_table']['cols'][col][0]
  board['tileset'][row][col] = value
  tileset = board['tileset']
  return tileset
end

# Filling turn data method + loading default tileset from config
def fill_turn!(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][1]
  col = CONFIG['address_table']['cols'][col][1]
  board['player_turns'][row][col] = value
  player_turns = board['player_turns']
  return player_turns
end

# Checking if tile still empty
def empty?(board, row, col)
  trow = CONFIG['address_table']['rows'][row][0]
  tcol = CONFIG['address_table']['cols'][col][0]
  row = CONFIG['address_table']['rows'][row][1]
  col = CONFIG['address_table']['cols'][col][1]
  tileset = board['tileset']
  player_turns = board['player_turns']
  tileset[trow][tcol].eql?(' ') & game_turns[row][col].zero?
end

# Checking if there any empty places on whole board
def untill_end?(board)
  board['player_turns'].flatten.select do |t|
    t.zero?
  end
end

# searching for winner lines
def winner_lines?(board, player)
  player_turns = board['player_turns']

  cols = player_turns.map do |row|
     row.reduce {|acc, val| acc = val if val == acc}
  end.include?(player)

  rows = player_turns.transpose.map do |row|
    row.reduce {|acc, val| acc = val if val == acc}
  end.include?(player)

  cols || rows
end

# searching for winner diagonals
def winner_dgnls?(board,player)
  lr = board['player_turns'].flatten.eql?([player,0,0,0,player,0,0,0,player])
  rl = board['player_turns'].flatten.eql?([0,0,player,0,player,0,player,0,0])
  lr || rl
end

# general win method
def win?(board, player)
  winner_lines?(board, player) || winner_dgnls?(board,player)
end

# A standart turn method
def turn(board, player)
  system 'cls'
  puts "|> Input Player##{player} turn: row,col (left\\right\\top\\bot\\mid)|"
  puts board['tileset']
  answer = gets.chomp
  return false unless answer.match?(/([top|bot] [left|right])|mid/)
  answer = answer.split(' ')
  case player
  when 1
    draw_tile!(board, answer[0], answer[1], 'X')
    puts board['tileset']
  when 2
    draw_tile!(board, answer[0], answer[1], 'O')
    puts board['tileset']
  else
    return false
  end
  fill_turn!(board, answer[0], answer[1], player)
end

# main game loop
loop do
  board =  CONFIG['board']
  winner = [1,2].cycle { |player|
    if turn(board, player)
      return player
    else
      return false
    end
  }

  system 'cls'
  puts "Player##{winner} won!"
  puts board['tileset']
  puts '|another game?|(y\n)'
  return unless gets.chomp == 'y'
end
