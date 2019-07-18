Kernel.print("Enter 2 numbers and an operator (x * y): ")
xby      = Kernel.gets().chomp()
x        = xby.split()[0].to_f()
operator = xby.split()[1]
y        = xby.split()[2].to_f()

if !xby.match(%r/\d+ (\*|\/|\+|-) \d+/)
  Kernel.puts("Error! Incorrect input!")
  return
end

case operator
when '*'
  answer = x * y
when '/'
  answer = y == 0 ? "Error! Cannot divide by zero!" : x / y
when '+'
  answer = x + y
when '-'
  answer = x - y
else
  answer = "Error! Unknown error, answer is nil!"
end

Kernel.puts("Answer is: #{answer}")
