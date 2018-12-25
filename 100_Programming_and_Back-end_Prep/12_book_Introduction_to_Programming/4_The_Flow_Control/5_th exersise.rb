def if_100(nbr)
nbr == case
    when nbr < 0
      puts "why so negatie"
    when nbr>=0
      puts "0-50"
    when nbr>50
      puts "51-100"
    when nbr>100
      puts "100 +"
    end
end

puts "Input positive number: "
number=gets.chomp.to_i
if_100(number)