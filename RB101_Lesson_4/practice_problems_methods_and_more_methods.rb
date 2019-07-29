def test
  [1, 2, 3].select do |num|
    num > 5
    'hi'
  end
end
# Select returns based on truthiness, last thing is 'hi'
#so everything is true and returned
p test == [1, 2, 3]

p ['ant', 'bat', 'caterpillar'].count { |str| str.length < 4 } == 2 # ant and bat 3 letters

p [1, 2, 3].reject { |num| puts num } == [1, 2, 3]
p [1, 2, 3].select { |num| puts num } == []

p ['ant', 'bear', 'cat'].each_with_object({}) { |value, hash| hash[value[0]] = value } == {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
hash = { a: 'ant', b: 'bear' }
p hash.shift == [:a,'ant']
p hash == { b: 'bear' }
p ['ant', 'bear', 'caterpillar'].pop.size == 'caterpillar'.size # pop returns last item, size is called on that
puts
p [1, 2, 3].any? == true
res = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end
p res == true

=begin
Since the Array#any? method returns true if the block ever returns a value other than false or nil, and the block returns true on the first iteration, we know that any? will return true. What is also interesting here is any? stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, puts num is only ever invoked for the first item in the array: 1.
=end

puts
puts
arr = [1, 2, 3, 4, 5]
p arr.take(2) == [1, 2, 3, 4, 5][0,2]
p arr == [1, 2, 3, 4, 5]
begin
  p arr.take(1,2)
rescue => er
  p er
  puts "take always take from start of the array"
end
puts
puts
p ( { a: 'ant', b: 'bear' }.map { |key, value| value if value.size > 3 } == [nil,"bear"] )
# if returns nil if no statement met, map always returns object of an original
# size and replaces element with return value of a block
res = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
p res == [1,nil,nil]

p arr = [1, 2, 3]
p hash = { a:1, b:2, c:3 }
hash.map { |e| puts e } # no map! method for hash, though map converts it to an array
p hash
arr.map! { |e| puts e } # now THIS is destructive read!
p arr
hash.transform_values! { |v| puts v } # THIS is destructive read for hash values!
p hash
p hash = { a:1, b:2, c:3 }
hash.transform_keys! { |k| puts k } # and this should be avoided
p hash
p hash = { a:1, b:2, c:3 }
hash.transform_values! { |v| puts v}
hash.transform_keys! { |k| puts k }
p hash
