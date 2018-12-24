def greeting(name)
  "Hi there, #{name.downcase.capitalize}!"
end
puts "Hi, what is your name?"
n=gets.chomp
puts greeting(n)