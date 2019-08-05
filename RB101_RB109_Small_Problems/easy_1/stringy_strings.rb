def stringy(size,flag = 1)
  numbers = []
  size.times do |index|
    if flag == 1
      number = index.even? ? 1 : 0
    else
      number = index.even? ? 0 : 1
    end
    numbers << number
  end
  numbers.join
end
puts stringy(0)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(6,0)
