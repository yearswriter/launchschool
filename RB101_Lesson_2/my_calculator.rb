Kernel.print("Enter 2 numbers and an operator (x * y): ")
xby      = Kernel.gets().chomp()
x        = xby.split()[0].to_f()
operator = xby.split()[1]
y        = xby.split()[2].to_f()

if !xby.match(%r/\d+ (\*|\/|\+|-) \d+/)
  Kernel.puts("Error! Incorrect input!")
  return
end

answer =  case operator
          when '*'
            x * y
          when '/'
            y == 0 ? "Error! Cannot divide by zero!" : x / y
          when '+'
            x + y
          when '-'
            x - y
          else
            "Error! Unknown error, answer is nil!"
          end

Kernel.puts("Answer is: #{answer}")
