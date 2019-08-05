def randomTeddy(name='Teddy')
  name='Teddy' if name.empty?
  p "#{name} is #{rand(20..200)} years old"
end
print "Name? "
name = gets.chomp.upcase
randomTeddy(name)
