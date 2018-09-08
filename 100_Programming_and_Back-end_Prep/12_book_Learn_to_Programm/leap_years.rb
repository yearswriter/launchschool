print "Years from "
s_year=gets.chomp.to_i
print " to "
e_year=gets.chomp.to_i
while s_year<=e_year
  if (s_year%4==0 && s_year%100!=0) || s_year%400==0
    puts "#{ s_year}"
  end
  s_year+=1
end