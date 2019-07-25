str = 'The grass is green'
p str[3,9][1,5]=='grass'
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
p arr[2, 3] == ['c','d','e']
p arr[2, 3][0] == 'c'
p arr [4,2] == ['e', 'f']

begin
  hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
  p hsh
rescue => er
  print er
end

begin
  arr = [3, 'd', nil]
  p arr.fetch(1)
  p arr.fetch(2)
  p arr.fetch(3)
rescue => er
  puts er
end

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

begin
  puts str[-6] == nil
  p arr.fetch(-6) == 'k'
rescue => er
  puts er
end

hsh = { :a => 1, 'b' => 'two', :c => nil }

begin
  p hsh['b']       # => "two"
  p hsh[:c]        # => nil
  p hsh['c']       # => nil
  p hsh[:d]        # => nil

  p hsh.fetch(:c)  # => nil
  p hsh.fetch('c') # => KeyError: key not found: "c"
rescue => er
  puts er
  begin
    p hsh.fetch(:d)  # => KeyError: key not found: :d
  rescue => er
    puts er
  end
end

str = 'How do you get to Carnegie Hall?'
p arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
p arr.join        # => "HowdoyougettoCarnegieHall?"
p arr = str.split('')
p arr.join
p arr = str.split
p arr.join(' ')

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
p arr.to_h == { name: 'Joe', age: 10, favorite_color: 'blue' }

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
str[6]  = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
p str
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
hsh # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }
