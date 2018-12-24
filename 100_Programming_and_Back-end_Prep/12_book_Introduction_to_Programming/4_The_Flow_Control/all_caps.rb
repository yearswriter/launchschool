def caps(string)
  if string.length >+ 10
    return string.upcase
  else
    return string
  end
end
s1 ="hello world"
puts "#{caps(s1)} \n because #{s1.length}"
s2= "Hello"
puts "#{caps(s2)} \n because #{s2.length}"