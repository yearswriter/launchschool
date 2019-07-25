def disemvowel(str)
  vowels = { a: '', o: '', i: '', u: '', e: '' }
  str.gsub(/[aoiue]/i,vowels)
end

def disemvowel(str)
  str.gsub /[aoiue]/i,''
end

def digital_root(n)
  local = 0
  local += n.digits.reduce(:+)
  if local.digits.size < 2
    return local
  else
    digital_root(local)
  end
end
