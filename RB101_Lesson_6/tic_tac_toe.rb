require 'yaml'
require 'pry'
require 'io/console'

board = YAML.load_file('./board.yml')

def check_terminal_size(_board)
  size = IO.console.winsize[1]
  return false unless size < 70

  "Terminal width of #{size} is unsupported,\
  minimal is 70 chars. Please resize and restart."
end

def clear
  system 'cls'
  system 'clear'
end

def set_turn!(board, value, row, col)
  row = board['rows'][row]
  col = board['cols'][col]
  tiles = board['game_field'].lines
  tiles[row][col] = value
  board['game_field'] = tiles.join('')
end

def set_hud!(board, player, game_score)
  game_field = board['game_field']
  player += ' ' * (8 - player.length)
  player = player[0...8]
  players_types = board['players_types']
  players_types.each do |player_type|
    game_field.gsub!(/#{player_type}.*(?=╟)/, player)
  end
  game_score.each do |key, value|
    game_field.gsub!(/\#\{#{key}\}/, value.to_s)
  end
  board['game_field'] = game_field
end

def draw_turn!(board, turn)
  player = turn[:player]
  value = turn[:value]
  address = turn[:address]
  game_score = turn[:score]

  set_turn!(board, value, *address)
  set_hud!(board, player, game_score)

  board
end

def get_board_status(board)
  game_field = board['game_field'].lines
  status = []
  board['rows'].each_value do |row|
    status_row = []
    board['cols'].each_value do |col|
      status_row.push(game_field[row][col])
    end
    status.push(status_row)
  end
  status
end

def promt(board, promt)
  er = check_terminal_size(board)
  if er
    puts er
    exit
  end
  board['game_field'] + ' ' + promt.to_s
end

def input
  print '        => '
  gets.chomp.to_s
end

def not_exist?(board, row, col)
  row_exist = board['rows'].keys.include?(row)
  col_exist = board['rows'].keys.include?(col)
  !(row_exist && col_exist)
end

def turn_input(board)
  promt = "Please enter your turn: \
  row col(umn)\
  (see legend above)"
  puts promt(board, promt)
  answer = input.split("\s")
  case answer
  when answer.empty?
    '[ERROR] Nothing was typed, please repeat.'
  when answer[1].empty?
    '[ERROR] Please input both row and column.'
  when not_exist?(answer)
    "[ERROR] Such row or column not exist,\
consult with legend above"
  end
end

# just tests, no point in checking them
# rubocop:disable  Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def tests(board)
  # neat way to work with stdin pipe
  # wonder if works on windows
  def with_stdin
     stdin = $stdin             # remember $stdin
     $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
     yield write                # pass pipe's "write end" to block
   ensure
     write.close                # close pipe
     $stdin = stdin             # restore $stdin
   end
  # ==================
  tests = YAML.load_file('./tests.yml')
  test_board = board
  puts 'Running tests: '
  clear_board = {
    player: 'computer',
    value: ' ',
    address: ['mid', 'mid'],
    score: {
      game_n: 1,
      player1_score: 0,
      player2_score: 0
    }
  }
  print 'Correctly draw empty board with hud: '
  set_hud!(test_board, 'computer', clear_board[:score])
  puts test_board['game_field'] == tests['empty_board']

  human_turn = {
    player: 'human',
    value: 'X',
    address: ['mid', 'mid'],
    score: {
      game_n: 1,
      player1_score: 0,
      player2_score: 0
    }
  }
  print 'Correctly draw example turn: '
  draw_turn!(test_board, human_turn)['game_field']
  puts test_board['game_field'] == tests['human_turn']

  test_board['rows'].each_key do |row|
    test_board['cols'].each_key do |col|
      set_turn!(test_board, 'X', row, col)
    end
  end
  print 'Draw marks at correct spots: '
  puts test_board['game_field'] == tests['adresses']

  promt = 'Hi there!'
  print 'Correctly draw board + promt: '
  puts promt(test_board, promt) == tests['promt']

  print 'Correctly gathers turns from game tiles: '
  should_be = [['X', 'X', 'X'], ['X', 'X', 'X'], ['X', 'X', 'X']]
  puts get_board_status(board) == should_be

  t = 4
  puts "Continiue in #{t} sec."
  sleep t
  clear
end
# rubocop:enable  Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
check_terminal_size(board)
tests(board)

player = ''
value = ''
row = ''
col = ''
game_n = ''
score1 = ''
score2 = ''
turn = {
  player: player,
  value: value,
  address: [row, col],
  score: {
    game_n: game_n,
    player1_score: score1,
    player2_score: score2
  }
}
