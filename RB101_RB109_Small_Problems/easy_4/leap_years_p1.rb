def leap_year?(year)
  by_four = year % 4
  by_hundred = year % 100
  by_four_hundred = year % 400
  (by_four.zero? && !by_hundred.zero?) || by_four_hundred.zero?
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
