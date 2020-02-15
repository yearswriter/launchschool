

# searching for winner lines
def winner_lines?(board, player)
  player_turns = board['player_turns']

  cols = player_turns.map do |row|
    row.reduce { |acc, val| val if val == acc }
  end

  rows = player_turns.transpose.map do |row|
    row.reduce { |acc, val| val if val == acc }
  end

  cols.include?(player) || rows.include?(player)
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
