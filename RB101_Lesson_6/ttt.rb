require 'yaml'
CONFIG = YAML.load_file('./config.yml')

# Drawing method + loading default tileset from config
def draw_tile(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][0]
  col = CONFIG['address_table']['cols'][col][0]
  board['tileset'][row][col] = value
  tileset = board['tileset']
  return tileset
end

# Collecting turn data method + loading default tileset from config
def collect_turns(board, row, col, value)
  row = CONFIG['address_table']['rows'][row][1]
  col = CONFIG['address_table']['cols'][col][1]
  board['game_turns'][row][col] = value
  game_turns = board['game_turns']
  return game_turns
end

# Checking if tile still empty
def empty?(board,row,col)
  trow = CONFIG['address_table']['rows'][row][0]
  tcol = CONFIG['address_table']['cols'][col][0]
  row = CONFIG['address_table']['rows'][row][1]
  col = CONFIG['address_table']['cols'][col][1]
  tileset = board['tileset']
  game_turns = board['game_turns']
  tileset[trow][tcol].eql?(' ') & game_turns[row][col].zero?
end

# Checking if there any empty places on whole board
def end?(board)
  CONFIG['address_table']['rows'].map do |row|
    CONFIG['address_table']['cols'].map do |col|
      empty?(board, row, col)
    end
  end
end
