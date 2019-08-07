def running_total(array)
  result = []
  array.each_with_index do |_, index|
    result[index] = array[0..index].inject(:+)
  end
  result
end

def running_total_ls(array)
  sum = 0
  array.map { |value| sum += value}
end

def running_total_seaweed(array)
  array.inject([]) { |result, n| result.push(n + result.last.to_i) }
end

def running_total(arr)
  arr.map.with_index { |_, i| arr[0..i].inject(:+) }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
