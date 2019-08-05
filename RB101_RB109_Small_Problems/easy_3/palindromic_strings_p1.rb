# input: string
# output: boolean (true if input string is a palinfrome, false otherwise)
#                 case matters, as does punctuation and spaces)
# edge cases:
# - empty string (false)
# - one character (false)
# - non string value (Error message)
# alg:
# - check edge cases with if - else and
# - - return from method immediately if one is found, accrodignly
# - initialise middle_index variable equal to string.size / 2
# if string.size.even?
# ..
# - if string [0..middle_index] == string [middle_index..string.size].reverse return true
# - else return false

def palindrome?(string)
  middle_index = string.size / 2
  case
  when string.class != String
      return puts "Error! Wrong input type!"
  when string.size <= 1
    return false
  when string.size.odd?
    string[0..middle_index] == string[middle_index.. string.size].reverse
  else
    string[0...middle_index] == string[middle_index... string.size].reverse
  end
end

=begin
def palindrome?(string)
  case
  when string.class != String
      return puts "Error! Wrong input type!"
  when string.size <= 1
    return false
  else
    string == string.reverse
  end
end
=end

p palindrome?('') == false
p palindrome?('m') == false
p palindrome?(1) == nil
p palindrome?([1,2]) == nil
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?('12321') == true
p palindrome?('123321') == true
