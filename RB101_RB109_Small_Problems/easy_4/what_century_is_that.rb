
def num_century(year)
  year += 100 unless (year % 100).zero?
  century = year / 100
end

def century(year)
  century = num_century(year).to_s
  return century + 'th' if ['11','12','13'].include?(century[-2..century.size])
  case century.chars.last
  when '1' then century + 'st'
  when '2' then century + 'nd'
  when '3' then century + 'rd'
  else century + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
