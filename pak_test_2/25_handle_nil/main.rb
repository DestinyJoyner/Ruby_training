# Creates an array [3, nil, 1, 5, nil, 2]. Removes nil values and sorts the array. Prints the sorted array.

arr = [3, nil, 1, 5, nil, 2]
# .nil? -> or .compact method
remove_nil = arr.select { |el| !el.nil? }
remove_nil.sort!
puts remove_nil
