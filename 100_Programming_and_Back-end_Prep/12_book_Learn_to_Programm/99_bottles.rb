i=99
def verse(i,enum)
  enum = i.to_s + " #{enum}"
  puts "#{enum.capitalize} on the wall, #{enum}."
  i-=1
  if i==1
    enum="one bottle of beer" 
  elsif i==0
    enum="no more bottles of beer"
  end
  puts "Take one down and pass it around, #{enum} on the wall"
  return i
end
until i<1
  if i>2 
    enum = "bottles of beer"
  elsif i==1
    enum = "bottle of beer"
  end
  i = verse(i,enum)
  puts
end
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
=begin 
suprised me how messy this is in exactly this form T_T. My brain hurts. 
Methink `yield` can help. I googled it's history, and I can reproduce original 6
strings, much easier but that's no fun:
=end