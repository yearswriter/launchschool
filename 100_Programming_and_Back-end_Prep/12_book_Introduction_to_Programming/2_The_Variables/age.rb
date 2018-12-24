puts "Hi, how old are you?"
age = gets.chomp.to_i
4.times{ |index| puts "In #{index*10} years you will be: \n#{(age+10*index).to_s}"}
# Must admit did google to know if index will index, first solved with interpolating 
#  #{(age=age+10).to_s}}, but in "In # years" looked obviosly wrong.