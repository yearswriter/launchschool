def repeat(string='Nothing was entered',times_repeat = 1)
  times_repeat.to_i.times{puts string}
end
puts "Enter string, number of times to repeat this string"
a = gets.chomp.split(',')
#5.times{puts 's'}
repeat(a[0],a[1])
