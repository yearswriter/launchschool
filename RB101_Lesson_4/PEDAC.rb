def palindromes(string)
  result = []
  for start_substring_index in 0..string.length-2
    for end_substring_index in (start_substring_index+2)..string.length
      cur = string[start_substring_index..end_substring_index]
      result << cur if cur == cur.reverse
    end
  end
  result.uniq
end
p palindromes("abcdefghomomohihihoh")
