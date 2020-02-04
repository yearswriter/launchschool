require 'yaml'
CONFIG = YAML.load_file('./config.yml')

def draw_on_tiles(tiles, row='mid', col='mid', value = ' ')
  row = CONFIG["state"]["tiles"]["rows"][row][0]
  col = CONFIG["state"]["tiles"]["cols"][col][0]
  tiles[row][col] = value
  return tiles
end

def fill_board(player,row,col,board)
  row = CONFIG["state"]["tiles"]["rows"][row][1]
  col = CONFIG["state"]["tiles"]["cols"][col][1]
  board[row][col]=player
end

def winner_row(board,cur_player)
  board.map do |row|
     row.reduce {|acc,val| acc = val if val == acc}
  end.include?(cur_player)
end

def winner_col(board,cur_player)
  board.map do |row,index|
  end
end

def turn(player,tiles,board)
  loop do
    system "cls"
    puts "|>Input Player##{player} turn: row,col (left\\right\\top\\bot\\mid)|"
    puts tiles
    answer = gets.chomp.split(' ')
    fill_board(player,answer[0],answer[1],board)
    if player == 1
      draw_on_tiles(tiles,answer[0],answer[1],'X')
      puts tiles
      puts board
      player = 2
    else
      draw_on_tiles(tiles,answer[0],answer[1],'O')
      puts tiles
      puts board
      player = 1
    end
  rescue StandardError => e
    puts "\n\n|>!ERROR!ROW first COL second, please repeat your answer:|"
    turn(player,tiles,board)
  end
end

loop do
  tiles = CONFIG["tiles"].lines
  board =  CONFIG["state"]["board"]
  player = 1
  turn(player,tiles,board)
  puts '|another game?|(y\n)'
  return unless gets.chomp == 'y'
end
