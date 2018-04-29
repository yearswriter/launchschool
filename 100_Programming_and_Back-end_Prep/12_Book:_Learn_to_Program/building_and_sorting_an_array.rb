#The best way
puts "The best, Loop-break way to do this is: \n\n"

puts "Enter another bunch of words: "
loop do 
  word = gets.chomp.downcase
  break if word=="" 
  words.push(word)
end
words.sort.each {|word| print "| #{word} "}

#Knee-jerk reaction, after I realised, about extra "" in while-do loop
puts "\n while-do in a method-return way to do this is: \n\n"

def split_by_enter                    #1 extra line (but being method, reusable)
  words =[]
  puts "Enter one word per line:"
  while true                          #basicly, I recreated loop-breake >_<
    word=gets.chomp.downcase
    return words.sort if word ==""    #2 extra line (but being method, reusable)
    words.push(word) 
  end
end                                   #3 extra line (but being method, reusable)
split_by_enter.sort.each {|word| print "| #{word} "}

#Alernative is to words.pop before sorting, to remove extra "":
puts "\n Another way to do this is: \n\n"

words =[]
word = nil                          #1 extra line
puts "Enter another bunch of words: "
until word ==""
  word = gets.chomp.downcase
  words.push(word)
end
words.pop                           #2 extra line
words.sort.each {|word| print "| #{word} "}