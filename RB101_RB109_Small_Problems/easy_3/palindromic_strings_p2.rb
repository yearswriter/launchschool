
def real_palindrome?(string)
  middle_index = string.size / 2
  case
  when string.class != String
      return puts "Error! Wrong input type!"
  when string.size <= 1
    return false
  when string.size.odd?
    string[0..middle_index].downcase.gsub(/\W/,'') == string[middle_index.. string.size].downcase.gsub(/\W/,'').reverse
  else
    string[0...middle_index].downcase.gsub(/\W/,'') == string[middle_index... string.size].downcase.gsub(/\W/,'').reverse
  end
end

=begin
def real_palindrome?(string)
  case
  when string.class != String
      return puts "Error! Wrong input type!"
  when string.size <= 1
    return false
  else
    string.downcase.delete('^a-z0-9') == string.downcase.delete('^a-z0-9').reverse
  end
end
=end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
