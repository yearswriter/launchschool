words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
result={}
words.each do |word|
  sorted_letters = word.split('').sort.join
  if result.has_key?(sorted_letters)
    result[sorted_letters].push(word)
  else
    result[sorted_letters]=[word]
  end
end
p result
#did check solution - and it is cool, my way was way less cool
