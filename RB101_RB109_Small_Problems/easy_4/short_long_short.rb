# input: two strings, different sizes
# output: one string, concatenated from 3 srings, short inout, long input + shortest one of the input again,
# alg:
# -- initialise resut array
# -- push all the strings into the result array
# -- sort array (longest string should be latter one when calling sort_by a <=> b)
# -- use << to add arr[0] to arr
# join arr with ''

def short_long_short(s1,s2)
  result = [s1,s2].sort_by { |s| s.length }
  result << result[0]
  result.join('')
end
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
