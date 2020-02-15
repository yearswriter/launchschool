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

def get_board_data(board, row, col, table)
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
  tile = get_board_data(board, row, col, 'tileset')
  turn = get_board_data(board, row, col, 'player_turns')
  tile.eql?(' ') || turn.zero?
end

# Checking if there any empty places on whole board
def out_of_turns?(board)
  board['player_turns'].flatten.select(&:zero?).empty?
end

def line_stat(player_turns, player)
  line_stat = []
  player_turns.each do |row|
    line_stat = row if row.count(player).eql?(3)
  end
  return line_stat
end

def diag_stat(player_turns, player, diag)
  diag_stat = []
  player_turns.each_with_index do |line, index|
    diag_stat.push(line[diag[index]])
  end
  diag_stat
end

def row_stat(board, player)
  player_turns = board['player_turns']
  return line_stat(player_turns, player)
end

def column_stat(board, player)
  player_turns = board['player_turns'].transpose
  return line_stat(player_turns, player)
end

def r_to_l_stat(board, player)
  diag = board['diag'].reverse
  player_turns = board['player_turns']
  return diag_stat(player_turns, player, diag)
end

def l_to_r_stat(board, player)
  diag = board['diag']
  player_turns = board['player_turns']
  return diag_stat(player_turns, player, diag)
end

def danger_line?(player_turns, player)
  danger_line = nil
  player_turns.each_with_index do |line, index|
    danger_line = index if line.count(player)eql?(2)
  end
  if danger_line.nil?
    return false
  else
    return danger_line?
  end
end

def win?(board, player)
  r = row_stat(board, player)
  c = column_stat(board, player)
  rd = r_to_l_stat(board, player)
  ld = l_to_r_stat(board, player)
  [r, c, rd, ld].any? do |stat|
    stat.count(player) == 3
  end
end

def random_turn!(board, player, sign, row, col)
  row row.sample
  col.sample
  until empty?(board, row, col)
    row.sample
    col.sample
  end
  fill_turn!(board, row, col, player)
  draw_tile!(board, row, col, sign)
end

def computer_turn!(board, player, sign)
  player_turns = board['player_turns']
  danger_row = danger_line?(player_turns,player)
  row_sample = board['rows'].keys.sample
  col_sample = board['cols'].keys.sample
  if danger_line


  random_turn!(board, player, sign, row_sample, col_sample)
end

# method to add HUD to tileset
def hud(tileset, game_n, score_1, score_2)
  left_side = ['     row     ',
               '     |||     ',
               '-top-mid-bot-']
  score = "         Game #{game_n + 1} score:
         Player № 1: #{score_1}
         PLayer № 2: #{score_2}"
  score = score.lines.map { |l| l.chomp.chars }
  right_side = score.transpose.map { |l| l.join('') }
  puts 'col _ left  | mid | right'.rjust(23)
  tileset = tileset.each_with_index.map do |line, index|
    left_hud = ''
    right_hud = ''
    left_side.each do |side_hud|
      left_hud << side_hud[index] + " "
    end
    right_side.each do |side_hud|
      right_hud << side_hud[index].to_s
    end
    left_hud << line << right_hud.to_s
  end
  puts tileset
end

# method for displaying status and promt + current board
def display(tileset, player, game_n, score_1, score_2)
  system 'cls'
  print "\n   => Input Player №#{player} turn:
          'row col'\n\n"
  hud(tileset, game_n, score_1, score_2)
  print "\n   => "
end

# A standart turn method
def turn!(board, player)
  case player
  when 1
    answer = gets.chomp.split(' ')
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
    return 'no such player ID'
  end
  # win condition checks
  if win?(board, player)
    return player
  elsif out_of_turns?(board)
    return 'Tie'
  end

  board
end

# main game loop
5.times do |game_n|
  score_1 = 0
  score_2 = 0
  board = YAML.load_file('./board.yml')
  game = [1, 2]
  system 'cls'
  puts "   => Game #{game_n + 1}
   => player sign is an 'X'
            Choose,
      go first or second:
            1 or 2
       "
  turn = gets.chomp
  display(board['tileset'], turn, game_n, score_1, score_2)
  case turn
  when '1'
    game = [1, 2]
  when '2'
    game = [2, 1]
  else
    return puts "Wrong answer"
  end
  game.cycle do |player|
    turn = turn!(board, player)
    display(board['tileset'], player, game_n, score_1, score_2)
    case turn
    when 'Wrong input'
      puts 'Wrong input'
      print '   => '
      redo
    when 'Cell is taken'
      puts 'Cell is taken'
      print '   => '
      redo
    when 1..2
      puts "Player №#{player} WOn!"
      print '   => '
      break
    when 'Tie'
      puts 'IT\'S A TIE!'
      print '   => '
      break
    else
      display(board['tileset'], player, game_n, score_1, score_2)
    end
  end
  print 'another game?|(y\n): '
  break unless gets.chomp == 'y'
end
