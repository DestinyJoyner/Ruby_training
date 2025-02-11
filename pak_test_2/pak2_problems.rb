# PART_2_IN_CLASS PROBLEMS

# Problem: 18_array

# Instructions:
# Write a Ruby script that:
#
# Creates an array of five numbers: [10, 20, 30, 40, 50].
# Prints the first and last elements.

# Your solution for 18_array goes here:
# Converting a range directly to an array -> (1..5).to_a
index_arr = Array (10..50).step(10).to_a
puts "First Element: #{index_arr[0]}"
puts "Last Element: #{index_arr[-1]}"

# Problem: 19_each

# Instructions:
# Write a Ruby script that:
#
# Creates an array [1, 2, 3].
# Adds 4 and 5 to the array.
# Removes the first element.
# Prints the final array.

# Your solution for 19_each goes here:
push_arr = (1..3).to_a
push_arr.push(4)
push_arr.push(5)
push_arr.shift
print "#{push_arr}"

# Problem: 20_modifying_array

# Instructions:
# Write a Ruby script that:
#
# Creates an array [1, 2, 3, 4, 5].
# Uses each to print each element squared

# Your solution for 20_modifying_array goes here:
squared_arr = (1..5).to_a
squared_arr.each do |el|
  puts el**2
end

# Problem: 21_filter_array

# Instructions:
# Write a Ruby script that:
#
# Creates an array [10, 15, 20, 25, 30].
# Filters only even numbers using select.
# Prints the new array.

# Your solution for 21_filter_array goes here:
filter_arr = (10..30).step(5).to_a

fil_arr = filter_arr.select { |el| el.even? }

print "#{fil_arr}"

# Problem: 22_sorting_array

# Instructions:
# Write a Ruby script that:
#
# Creates an array [5, 2, 8, 3, 1].
# Sorts it in ascending order.
# Prints the sorted array.

# Your solution for 22_sorting_array goes here:

sort_arr = [5, 2, 8, 3, 1]
# sort -> non-destructive, sort! -> destructive
sort_arr.sort!
print sort_arr

# Problem: 23_handle_empty_array

# Instructions:
# Write a Ruby script that:
#
# Initializes an empty array.
# Checks if the array is empty.
# Prints "Array is empty" if it's empty; otherwise, prints "Array is not empty".

# Your solution for 23_handle_empty_array goes here:
empty_arr = []

puts empty_arr.empty? ? 'Array is empty' : 'Array is not empty'

# Problem: 24_remove_duplicates

# Instructions:
# Write a Ruby script that:
#
# Creates an array with duplicate values [1, 2, 2, 3, 3, 3, 4].
# Removes duplicates using .uniq.
# Prints the new array.

# Your solution for 24_remove_duplicates goes here:
duplicate_arr = [1, 2, 2, 3, 3, 3, 4]
# uniq and uniq!
duplicate_arr.uniq!
puts duplicate_arr

# Problem: 25_handle_nil

# Instructions:
# Write a Ruby script that:
#
# Creates an array [3, nil, 1, 5, nil, 2].
# Removes nil values and sorts the array.
# Prints the sorted array.

# Your solution for 25_handle_nil goes here:
nil_arr = [3, nil, 1, 5, nil, 2]
# .nil? -> or .compact method
remove_nil = nil_arr.select { |el| !el.nil? }
remove_nil.sort!
puts remove_nil

# Problem: 26_handle_nested_array

# Instructions:
# Write a Ruby script that:
#
# Creates a nested array [[1, 2], [3, 4], [5, 6]].
# Flattens the array.
# Prints the new array.

# Your solution for 26_handle_nested_array goes here:
nested_arr = [[1, 2], [3, 4], [5, 6]]
# flatten method, flat_map method, nested loop push to new array
flat_arr = nested_arr.flatten
print flat_arr

# Problem: 27_hashes

# Instructions:
# Write a Ruby script that:
#
# Creates a hash representing a person: name is Alice, city is New York
# Prints "Alice is 25 years old and lives in New York." using hash access.

# Your solution for 27_hashes goes here:
person = {
  name: 'Alice',
  city: 'New York',
  age: 25
}

puts "#{person[:name]} is #{person[:age]} years old and lives in #{person[:city]}."

# Problem: 28_adding_updating

# Instructions:
# Write a Ruby script that:
#
# Creates a hash { name: "Alice", age: 25 }.
# Adds "city: New York" to the hash.
# Updates "age" to 26.
# Removes "name".
# Prints the final hash.

# Your solution for 28_adding_updating goes here:
hash_update = { name: 'Alice', age: 25 }

hash_update[:city] = 'New York'
hash_update[:age] = 26
hash_update.delete(:name)

puts hash_update

# Problem: 29_iterating_over_hash

# Instructions:
# Write a Ruby script that:
#
# Creates a hash { apple: 3, banana: 5, cherry: 2 }.
# Iterates over it and prints:
# "apple: 3"
# "banana: 5"
# "cherry: 2"

# Your solution for 29_iterating_over_hash goes here:
fruit = { apple: 3, banana: 5, cherry: 2 }
# each
fruit.each do |key, val|
  puts "#{key}: #{val}"
end

# Problem: 30_merging_hashes

# Instructions:
# Write a Ruby script that:
#
# Creates two hashes:
# { a: 1, b: 2 } and { b: 3, c: 4 }
# Merges them into one hash.
# Prints the final hash.

# Your solution for 30_merging_hashes goes here:
hash_1 = { a: 1, b: 2 }
hash_2 = { b: 3, c: 4 }
# merge and merge!
hash_1.merge!(hash_2)
puts hash_1

# Problem: 31_missing_key

# Instructions:
# Write a Ruby script that:
#
# Creates a hash { name: "Alice" }.
# Tries to fetch the "age" key, handling the missing key by returning "Unknown".

# Your solution for 31_missing_key goes here:
fetch_hash = { name: 'Alice' }
# fetch method like python gets
puts fetch_hash.fetch('age', 'Unknown')

# Problem: 32_handle_empty_hash

# Instructions:
# Write a Ruby script that:
#
# Initializes an empty hash.
# Checks if it is empty.
# Prints "Hash is empty" if it is empty.

# Your solution for 32_handle_empty_hash goes here:
empty_hash = {}
puts empty_hash.empty? ? 'Hash is empty' : 'Hash is not empty'

# Problem: 33_nested_hashes

# Instructions:
# Write a Ruby script that:
#
# Creates a nested hash representing a library:
# {
#    fiction: { books: ["1984", "Brave New World"] },
#    non_fiction: { books: ["Sapiens", "Educated"] }
# }
# Prints "First fiction book: 1984" and "First non-fiction book: Sapiens".

# Your solution for 33_nested_hashes goes here:
nested_hash = { fiction: { books: ['1984', 'Brave New World'] }, non_fiction: { books: %w[Sapiens Educated] } }

puts "First fiction book: #{nested_hash[:fiction][:books][0]}"
puts "First non-fiction book: #{nested_hash[:non_fiction][:books][0]} "

# Problem: 34_key_sorting

# Instructions:
# Write a Ruby script that:
#
# Creates a hash {c: 3, a: 1, b: 2}.
# Sorts it by keys and prints the sorted hash.

# Your solution for 34_key_sorting goes here:
unsorted_hash = { c: 3, a: 1, b: 2 }
# sort -> returns arr of arrs -> turn back to hash
sorted_hash = unsorted_hash.sort.to_h

puts sorted_hash

# Problem: 35_different_key_in_hash

# Instructions:
# Write a Ruby script that:
#
# Creates a hash with different key types:
#
# {
#   "name" => "Alice",
#   1 => "Number Key",
#   :symbol_key => "Symbol Key",
#   [1, 2, 3] => "Array Key"
# }
#
# Prints each key-value pair.

# Your solution for 35_different_key_in_hash goes here:
# hash rocket syntax
diff_key_hash = {
  'name' => 'Alice',
  1 => 'Number Key',
  :symbol_key => 'Symbol Key',
  [1, 2, 3] => 'Array Key'
}

diff_key_hash.each do |key, val|
  puts "#{key}: #{val}"
end
