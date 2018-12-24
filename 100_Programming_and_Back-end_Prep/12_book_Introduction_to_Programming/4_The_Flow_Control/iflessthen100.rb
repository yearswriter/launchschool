puts "Input positive number: "
number=gets.chomp.to_i
number == case  #curisity, just casing with comparisons didn't work, this works, why?
  when number < 0
    puts "why so negatie"
  when number>=0
    puts "0-50"
  when number>50
    puts "51-100"
  when number>100
    puts "100 +"
  end