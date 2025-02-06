# Creates an array [10, 15, 20, 25, 30]. Filters only even numbers using select. Prints the new array.

arr = (10..30).step(5).to_a

fil_arr = arr.select { |el| el.even? }

print fil_arr
