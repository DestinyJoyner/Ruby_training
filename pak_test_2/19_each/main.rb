# Creates an array [1, 2, 3]. Adds 4 and 5 to the array. Removes the first element. Prints the final array.

arr = (1..3).to_a
arr.push(4)
arr.push(5)
arr.shift
print arr
