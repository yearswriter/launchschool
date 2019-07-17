sentence = ''
sentence.split.map{|word| word.reverse! if word.length >=5}.join(' ')
