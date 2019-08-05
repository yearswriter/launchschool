
def reverse_words(sentence)
  sentence.split.each{|word| word.reverse! if word.length >=5}.join(' ')
end
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
