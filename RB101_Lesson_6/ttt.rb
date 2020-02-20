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
  tile.eql?(' ') || turn.eql?(0)
end

# Checking if there any empty places on whole board
def out_of_turns?(board)
  board['player_turns'].flatten.select { |t| t.eql?(0) }.empty?
end

def line_stat(player_turns, player)
  line_stat = []
  player_turns.each do |row|
    line_stat = row if row.count(player).eql?(3)
  end
  line_stat
end

def diag_stat(player_turns, _player, diag)
  diag_stat = []
  player_turns.each_with_index do |line, index|
    diag_stat.push(line[diag[index]])
  end
  diag_stat
end

def row_stat(board, player)
  player_turns = board['player_turns']
  line_stat(player_turns, player)
end

def column_stat(board, player)
  player_turns = board['player_turns'].transpose
  line_stat(player_turns, player)
end

def r_to_l_stat(board, player)
  diag = board['diag'].reverse
  player_turns = board['player_turns']
  diag_stat(player_turns, player, diag)
end

def l_to_r_stat(board, player)
  diag = board['diag']
  player_turns = board['player_turns']
  diag_stat(player_turns, player, diag)
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

def danger_line?(player_turns, player)
  danger_line = false
  player_turns.each_with_index do |line, index|
    danger_line = index if line.count(player).eql?(2)
  end
  danger_line
end

def finisher_turn!(board, player)
  row = danger_line?(board['player_turns'], player)
  col = danger_line?(board['player_turns'].transpose, player)
  loop do
    row = board['rows'].keys[row] if row
    col = board['cols'].keys[col] if col
    row ||= board['rows'].keys.sample
    col ||= board['cols'].keys.sample
    break if empty?(board, row, col)
  end
  return row, col
end

def random_turn!(board)
  row = board['rows'].keys.sample
  col = board['cols'].keys.sample
  loop do
    col = board['cols'].keys.sample
    row = board['rows'].keys.sample
    break if empty?(board, row, col)
  end
  return row, col
end

def computer_turn!(board, player, sign, ai_type)
  address = []
  case ai_type
  when 'random'
    address = random_turn!(board)
  when 'defensive'
    address = finisher_turn!(board, 'human')
  end
  fill_turn!(board, *address, player)
  draw_tile!(board, *address, sign)
end

def human_turn!(board, player, _sign)
  # input checks
  answer = gets.chomp
  return 'Wrong input' if answer.empty?

  answer = answer.split(' ')
  return 'Wrong input' if answer[1].nil?
  return 'Wrong input' unless answer[0].match?(/top|bot|mid/)
  return 'Wrong input' unless answer[1].match?(/left|right|mid/)
  return 'Cell is taken' unless empty?(board, *answer)

  fill_turn!(board, *answer, player)
  draw_tile!(board, *answer, 'X')
end

# method to add HUD to tileset
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# This is last messy method and it does do arcane stuff
# to format output
def hud(tileset, game_n, score1, score2)
  left_side = ['     row     ',
               '     |||     ',
               '-top-mid-bot-']
  score = "             Game #{game_n.to_i + 1} score:
                  Human: #{score1}
               Computer: #{score2}"
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
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

# method for displaying status and promt + current board
# rubocop:disable Metrics/ParameterLists
# probably can just pass objects instead of huge param list
def display(tileset, _player, game_n, score1, score2, mesg, error)
  system 'clear'
  system 'cls'
  hud(tileset, game_n, score1, score2)
  puts mesg.rjust(23)
  puts error.to_s.rjust(23)
  print "   => ".rjust(3)
end
# rubocop:enable Metrics/ParameterLists

# A standart turn method
def turn!(board, player)
  turn = case player
         when 'human'
           human_turn!(board, player, 'X')
         when 'computer'
           computer_turn!(board, player, 'O', 'defensive')
         else
           'Wrong player type!'
         end
  winner = win?(board, player)
  if winner
    return player
  elsif out_of_turns?(board)
    return 'Tie'
  end

  turn
end

# main game loop
game_set = ['']
game = ['']
mesg = ''
error = ''
game_set.each_with_index do |_game_winner, game_n|
  score1 = game_set.count('human')
  score2 = game_set.count('computer')
  board = YAML.load_file('./board.yml')

  system 'cls'
  mesg = "Game #{game_n + 1}," \
         "player sign is an 'X'\n" \
         "Choose, go first or second:
                 1 or 2"
  display(board['tileset'], '', game_n, score1, score2, mesg, error)
  case gets.chomp
  when '1'
    game = ['human', 'computer']
    error = ''
  when '2'
    game = ['computer', 'human']
    error = ''
  else
    error = 'There is no such player'
    display(board['tileset'], '', game_n, score1, score2, mesg, error)
    redo
  end

  game.cycle do |player|
    mesg = "Game #{game_n + 1}:\n" \
           "Input #{player.capitalize} player turn: 'row col'"
    display(board['tileset'], player, game_n, score1, score2, mesg, error)
    turn = turn!(board, player)
    case turn
    when 'Wrong input'
      error = 'Wrong input'
      redo
    when 'Cell is taken'
      error =  'Cell is taken'
      redo
    when 'human' || 'computer'
      error = ''
      mesg = "#{player.capitalize} player WON!"
      game_set.push(player)
      display(board['tileset'], player, game_n, score1, score2, mesg, error)
      break
    when 'Tie'
      error = ''
      mesg =  'IT\'S A TIE!'
      game_set.push('tie')
      display(board['tileset'], player, game_n, score1, score2, mesg, error)
      break
    end
    error = ''
  end

  print 'another game?|(y or n): '

  answer = gets.chomp.downcase
  if answer.eql?('n') || game_set.length > 5
    display(board['tileset'], '', game_n, score1, score2, 'Game Over!', '')
    break
  end
end
