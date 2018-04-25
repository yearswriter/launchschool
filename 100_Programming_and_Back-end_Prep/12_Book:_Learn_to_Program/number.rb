print "What is your favorite number? "
fav_num=gets.chomp.to_i
unless fav_num==42
  real_fav_nam=fav_num+1
  puts "#{fav_num} is a good number, but number #{real_fav_nam} \nis bigger, and therefore better!"
else
  puts "So long, and thanks for all the fish!"
end
