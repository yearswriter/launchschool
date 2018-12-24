puts 5*4*3*2*1
puts 6*5*4*3*2*1
puts 7*6*5*4*3*2*1
puts 8*7*6*5*4*3*2*1 
def factorial(number)
   return 1 if number == 0
   return number*factorial(number-1)
end
puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)
#really? no standard  factorial method? -_-