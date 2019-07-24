# Question 1
if false
  greeting = “hello world”
end

p greeting.nil?

# Question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
p "puts informal_greeting.clone == informal_greeting"
puts informal_greeting.clone == informal_greeting
p "puts informal_greeting.clone.object_id == informal_greeting.object_id"
puts informal_greeting.clone.object_id == informal_greeting.object_id
puts


# Question 3
def mess_with_vars(one, two, three)
  one = two #< local variable
  two = three
  three = one
  return one, two, three
end

one = "one"
two = "two"
three = "three"

saved_one, saved_two, saved_three = mess_with_vars(one, two, three)

puts "one is: #{one} but saved_one is #{saved_one}"
puts "two is: #{two} but saved_one is #{saved_two}"
puts "three is: #{three} but saved_one is #{saved_three}"
puts

def mess_with_vars(one, two, three)
  one = "two" #< local variable
  two = "three"
  three = "one"
  return one, two, three
end

one = "one"
two = "two"
three = "three"

saved_one, saved_two, saved_three = mess_with_vars(one, two, three)

puts "one is: #{one} but saved_one is #{saved_one}"
puts "two is: #{two} but saved_one is #{saved_two}"
puts "three is: #{three} but saved_one is #{saved_three}"
puts

def mess_with_vars(one, two, three)
  saved_one = ''
  saved_two = ''
  saved_three = ''
  saved_one += one
  saved_two += two
  saved_three += three
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
  return saved_one, saved_two, saved_three
end

one = "one"
two = "two"
three = "three"

saved_one, saved_two, saved_three = mess_with_vars(one, two, three)

puts "one is: #{one} but saved_one is #{saved_one}"
puts "two is: #{two} but saved_one is #{saved_two}"
puts "three is: #{three} but saved_one is #{saved_three}"
puts

# Question 4
# "4.5.5" or "1.2.3.4.5" should be invalid
def is_an_ip_number?(string)
  string[/[0-9]+/]
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size !=4

  dot_separated_words.each do |number|
    return false unless is_an_ip_number?(number)
  end

  true
end

p dot_separated_ip_address?('10.204.20.62') == true
p dot_separated_ip_address?('1.2.3.4.5') == false
p dot_separated_ip_address?('4.5.5') == false
