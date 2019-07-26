produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  keys = hash.keys
  result = {}
  counter = 0
   loop do
    break if counter >= keys.length
    current = keys[counter]
    result[current] = hash[current] if hash[current] == "Fruit"
    counter +=1
  end
  result
end

p select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers.object_id
p double_numbers!(my_numbers) == [2, 8, 6, 14, 4, 12]
p my_numbers.object_id

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)  == [1, 8, 3, 14, 2, 12]
                                    #|0||1||2||3||4||5|
p my_numbers                      == [1, 4, 3, 7, 2, 6]# not mutated

def multiply!(numbers,multipliyer)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= multipliyer

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply!(my_numbers, 3) == [3, 12, 9, 21, 6, 18]
