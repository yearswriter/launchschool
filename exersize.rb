def division_stringified(num1, num2)
  return 'Cannot divide by 0' if num2.zero?

  result = (num1.to_f / num2).round(0).to_s.reverse
  comma_correction = 0
  for string_index in 1...result.length
    if (string_index % 3).zero?
      result.insert(string_index + comma_correction, ',')
      comma_correction += 1
      # adjusting for new string length (with extra ',')
    end
  end
  result.reverse
end
#---
def division_stringified(num1, num2)
  div_str_array = (num1 / num2.to_f).round(0).to_s.chars.reverse

  div_str_array.each_with_index do |char, i|
    char << ',' if (i) % 3 == 0 && !i.zero?

    end
  end
  div_str_array.reverse.join
end
#--
p division_stringified(2, 0)
p division_stringified(2, 3) == '1'
p division_stringified(5, 2) == '3'
p division_stringified(7, 3) == '2'
p division_stringified(6_874, 67) == '103'
p division_stringified(503_394_930, 43) == '11,706,859'
p division_stringified(1, 10) == '0'
p division_stringified(100_000, 1) == '100,000'
