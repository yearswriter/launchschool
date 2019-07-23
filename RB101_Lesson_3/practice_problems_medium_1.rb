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

  a = gets.chomp.to_i
  p factors(a)
rescue => er
  p er
  p factors_fixed(a)
end
