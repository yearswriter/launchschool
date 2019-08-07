ASCII_NUMBERS = []
HEX_NUMBERS = []
10.times { |d| ASCII_NUMBERS[d] = d.to_s.ord }

HEX_NUMBERS << ASCII_NUMBERS
['A', 'B', 'C', 'D', 'E', 'F'].each { |h| HEX_NUMBERS << h.ord }
HEX_NUMBERS.flatten!

def string_to_integer(s_num, base = 10, numbers = ASCII_NUMBERS)
  digit = 0
  digits_array = s_num.upcase.chars.map { |c| numbers.index(c.ord) }
  p digits_array
  digits_array.reverse.each_with_index { |d, i| digit += d * (base**i) }
  digit
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

p string_to_integer('4D9f', 16, HEX_NUMBERS)
