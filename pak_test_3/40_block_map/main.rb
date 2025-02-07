# Defines an array [1, 2, 3, 4]. Uses .map with a block to double each number. Prints the new array.

# notes
# # map method returns array
# mapped_arr = negative_nums.map { |el| el.abs }

arr = (1..4).to_a
mapped_arr = arr.map { |el| el * 2 }
puts "#{mapped_arr}"
