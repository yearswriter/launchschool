flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index { | n, i | flintstones_hash[n] = i }
p flintstones_hash
p ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.inject(:+)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |_, age| age <= 100}
p ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.min
lintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p lintstones.index { |name| name.start_with?(/Be/) }
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! { |name| name[0,2] }
statement = "The Flintstones Rock"
let = statement.chars.each_with_object({}) do | letter, result|
  result[letter].nil? ? result[letter] = 1 : result[letter] += 1
end
p let

numbers = [1, 2, 3, 4]
ret = numbers.each_with_index do |number, index|
  puts "from #{index} shift #{number}\n  before: #{numbers.inspect}"
  numbers.shift(1)
  puts "  after: #{numbers.inspect}"
end
# When we cut index length in the middle of an enum method, it sees it and shortens cycle
p numbers == [3,4] #Only 2 iterations managed to run
numbers = [1, 2, 3, 4, 5, 6, 7, 8]

ret = numbers.each_with_index do |number, index|
  puts "from #{index} shift #{number}\n  before: #{numbers.inspect}"
  numbers.shift(1)
  puts "  after: #{numbers.inspect}"
end
p numbers
# effectively halves iteration count every time, rounds to smallest
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.each_with_index do |number, index|
  puts "from #{index} pops #{number}\n  before: #{numbers.inspect}"
  numbers.pop(1)
  puts "  after: #{numbers.inspect}"
end
p numbers
input = "the flintstones rock"
def titleize(string)
  words = string.split
  words.map! { |word| word.capitalize }
  words.join(" ")
end
p titleize(input)
p input
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each_value do |munster|
  if munster["age"] < 18
    munster["age_group"] = "kid"
  elsif munster["age"] < 64
    munster["age_group"] = "adult"
  else
    munster["age_group"] = "senior"
  end
end

p munsters
