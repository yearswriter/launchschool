# input: array
# output: result_array
# edge cases:
# - empty array
# - multi dimensional arrays
# alg:
# - initialize counter variable equal 0
# - call select with index and values on inpit array:
# -  - increment counter variable (so we can be at 1st index)
# -  - if current index.odd?
# - -  - return true
# -  - else
# - -  - return false

def oddities(array)
  index = 0
  array.select do | _ |
    index += 1
    index.odd? ? true : false
  end
end

p oddities([[1, 2], [3, 4], 5]) == [[1, 2], 5]
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p arr = [2, 3, 4, 5, 6]
p oddities(arr)
p arr
