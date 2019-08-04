def count_char(string=nil)
  print 'Please write word or multiple words: '
  string = gets.chomp if string.nil?
  size = string.split(' ').join('').length
  "There are #{size} characters in \"#{string}\"."
end

p count_char('walk') == 'There are 4 characters in "walk".'
p count_char('walk, don\'t run') == 'There are 13 characters in "walk, don\'t run".'
p count_char
