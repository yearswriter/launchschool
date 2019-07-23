# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts "Spot is present: #{!ages['Spot'].nil?}."
puts "Spot is present: #{ages.key?('Spot')}."
puts "Spot is present: #{ages.include?('Spot')}."
puts "Spot is present: #{ages.member?('Spot')}."

# Question 2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

additional_ages.map { |munster, age| ages[munster] = age }
p ages

ages.merge!(additional_ages)
p ages

# Question 4
p advice = "Few things in life are as important as house training your pet dinosaur."
puts "Name 'Dino' appears in the string: #{!!advice[/Dino/]}"

# Question 5
p flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << 'Dino'
p flintstones.push('Dino')
p flintstones.append('Dino')
p flintstones.concat(%w(Dino))

# Question 7
p flintstones.concat(%w(Dino Hoppy))

# Question 8
p advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(/.*(?=(house))/)
p advice
p advice.slice!(/.*(?=(house))/)
p advice

# Question 9
p statement = "The Flintstones Rock!"
p statement.count('t')

# Question 10
title = "Flintstone Family Members"
p title.center(40)
