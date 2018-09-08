puts "Type a sentence: "
sentence = gets.chomp.downcase.split(" ")
puts sentence.sort{|a,z| a <=> z}