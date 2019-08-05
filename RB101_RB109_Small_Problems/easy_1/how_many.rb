vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  @hash={}
  array.each{|el| @hash[el.to_sym] = array.count(el)} #array.count(el.downcase)
  return @hash.each{|el,c| puts "#{el} => #{c}"}
end

count_occurrences(vehicles)
