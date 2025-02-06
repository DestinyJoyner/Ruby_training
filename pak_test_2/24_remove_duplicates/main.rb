# Creates an array with duplicate values [1, 2, 2, 3, 3, 3, 4]. Removes duplicates using .uniq. Prints the new array.

arr = [1, 2, 2, 3, 3, 3, 4]
# uniq and uniq!
arr.uniq!
puts arr
