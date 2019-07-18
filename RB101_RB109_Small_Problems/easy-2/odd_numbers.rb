def odd(number)
  return if number <= 0
  puts number if number % 2 !=0
  odd(number - 1)
end
odd(99)
