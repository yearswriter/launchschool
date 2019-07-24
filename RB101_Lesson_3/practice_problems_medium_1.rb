# Question 1
10.times { |time| puts " " * time + "The Flinstones Rock".prepend}

# Question 2
begin
  puts "the value of 40 + 2 is " + (40 + 2)
rescue TypeError => er
  p er
  puts "the value of 40 + 2 is #{40 + 2}"
  puts "the value of 40 + 2 is " + (40 + 2).to_s
end

# Question 3
begin

  def factors(number)
    divisor = number
    factors = []
    begin
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end until divisor == 0
    factors
  end

  def factors_fixed(number)
    divisor = number
    factors = []
    while divisor > 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
    factors
  end

  p "Input number to factor:"
  a = gets.chomp.to_i
  p factors(a)
rescue => er
  p er
  puts factors_fixed(a)
end

# Question 4
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
puts "initial buffer1:"
p buffer1=[]
puts "initial buffer2:"
p buffer2=[]
result1=''
result2=''

3.times do |number|
  result1 = rolling_buffer1(buffer1, 2, number)
  result2 = rolling_buffer2(buffer2, 2, number)
end
puts "3.times { | number | rolling_buffer1( buffer1, 2, number ) } returns #{3.times { | number | rolling_buffer1( buffer1, 2, number ) }}"
p "Buffer itself: #{buffer1}"
puts "3.times { | number | rolling_buffer2( buffer2, 2, number ) } returns #{3.times { | number | rolling_buffer2( buffer2, 2, number ) }}"
p "Buffer itself: #{buffer2}"
puts "Also, curious note: accumulating result of both in separate variables differs: result1: #{result1}, result2: #{result2}"

buffer1=[]
buffer2=[]
result1=''
result2=''

3.times do |number|
  p "--"
  p rolling_buffer1(buffer1, 2, number)
  p rolling_buffer2(buffer2, 2, number)
end

# Question 5

begin
  limit = 15

  def fib(first_num, second_num)
    while first_num + second_num < limit
      sum = first_num + second_num
      first_num = second_num
      second_num = sum
    end
    sum
  end

  def fib_fixed(first_num, second_num, limit)
    while first_num + second_num < limit
      sum = first_num + second_num
      first_num = second_num
      second_num = sum
    end
    sum
  end

  result = fib(0, 1)
  puts "result is #{result}"
rescue => er
  p er
  result = fib_fixed(0, 1, 15)
  puts "fixed result is #{result}"
end

# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 == 34

# Question 7

p munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member| #map would've saved the family or just storing argument in internal hash
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

#Question 9
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) == "no"
