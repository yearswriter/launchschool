def multisum(num, multi = [])
  if num < 1
    return multi.inject(:+)
  elsif (num % 3).zero? || (num % 5).zero?
    multi << num
  end

  multisum(num - 1, multi)
end

p  multisum(3) == 3
p  multisum(5) == 8
p  multisum(10) == 33
p  multisum(1000) == 234168
