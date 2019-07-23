# Question 1:
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
puts "'uniq' does not mutate object. 'puts' will output each number on new line"

# Question 2
puts "1 != 2, !true == false, a = true ? true : false, !!true = true, some methods also use ?, like start_with?"

# Question 3
puts advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub('important','urgent')

# Question 4
numbers = [1, 2, 3, 4, 5]
p numbers
p numbers.delete_at(1)
p numbers.delete(1)
p numbers.delete(7)
p numbers.delete_at(7)
puts "Array#delete_at(index) returns array with element  removed at index, Array#delete(1) returns array with element '1' removed, both return 'nil' if elements not found"

# Question 5
p (10..100).cover?(42)

# Question 6
puts famous_words = "seven years ago..."
puts "Four score and " << famous_words
puts "Four score and #{famous_words}"
puts "Four score and " + famous_words
puts famous_words.prepend("Four score and ")

#Question 7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)
# ^ that is some functional magic, need to ask Uno later

# Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!

# Queston 9:
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")
