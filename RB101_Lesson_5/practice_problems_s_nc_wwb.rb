arr = ['10', '11', '9', '7', '8'] # to_i !!!!!!!
arr.sort { |a,b| a.to_i <=> b.to_i}
p arr

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
p books.sort_by { |book| book[:published]}
p books
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1].last
p arr3[2][:third][0][0]
p arr2.last[:third].first
p hsh1['b'].last
p hsh2[:third].keys.first

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
p arr1
arr2[2] = 4
p arr2
hsh1[:first][2][0] = 4
p hsh1
p hsh2[['a']][:a][2] = 4
p hsh2

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each_value do | munster |
  total_age += munster['age'] if munster['gender'] == 'male'
end

p total_age
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do | munster, details|
  puts "#{munster.capitalize} is a #{details['age']}-year-old #{details['gender']}."
end

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr == []

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


vowels = 'aeiou'

hsh.each_value do |value|
  value.each do |str|
    str.chars.each do |char|
      print char if vowels.include?(char)
    end
  end
end
puts
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.each do |sub_array|
  sub_array.sort! {|a,b| b<=>a}
end
p arr

res = []
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |sub_hash|
  newhsh = {}
  sub_hash.each do |k,v|
    newhsh[k] = v + 1
  end
  res.push(newhsh)
end
p res
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map! do |sub_arr|
  sub_arr.select{|el| el % 3 == 0}
end
p arr

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p arr.to_h
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
p hsh
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

r = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p r

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

r = arr.map do |hash|
  hash.map do |_,internal_array|
    internal_array.select { |el| el.odd? }
  end
end

p r
r = arr.map do |hash|
  hash.each_value do |internal_array|
    internal_array.select! { |el| el.even? }
  end
end

p r
arr.select do |hsh| #select all hashes on which hsh.all? returns true
  hsh.all? do |_, value| #select all internal_array on which value.all returns true
    value.all? do |num| #select all elements of internal_array on which num.even? returns true
      num.even? #returns true if number is even
    end
  end
end
p r

def generate_UUID
  characters = []                                  # array of possible characters
  (0..9).each { |digit| characters << digit.to_s } # generation of possible numbers
  ('a'..'f').each { |digit| characters << digit }  # generation of possible characters (for base 16)

  uuid = ""
  sections = [8, 4, 4, 4, 12] # array of string format (how many base 16 numbers before breaking them with '-')
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
