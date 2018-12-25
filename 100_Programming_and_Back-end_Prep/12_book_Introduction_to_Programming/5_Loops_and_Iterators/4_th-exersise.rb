def floor(n)
  puts "With a click of a fingers #{n} of a #{n.class.to_s.downcase}:"
  i=-1
  if (n % 1) >0  
    puts "Actually, cant count anything but fixnum"
    return
  else
    n=n.to_i
    i = i * (-1) if n < 0  
    if n != 0
      floor(n+i)
    end
  end
end
#I did overdo it 
puts "Enter numer to lvl it with 0"
numb=gets.chomp.to_f
floor(numb)