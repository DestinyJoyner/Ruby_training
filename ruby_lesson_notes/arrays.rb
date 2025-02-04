#
#   # VARIABLES
#   # Local variables (start with lowercase letter or underscore)
# name = "Destiny"
# age = 25
# _temp = "temporary"
#
# Instance variables (start with @)
# @name = "Destiny"
# @age = 25
#
# Class variables (start with @@)
# @@count = 0
#
# Global variables (start with $)
# $global_var = "I'm available everywhere"
#
# Constants (start with uppercase letter)
# MAX_LIMIT = 100
# PI = 3.14
#
# Arrays -> collection of strings/ integers -> []

arr1 = [1, 2, 3, 4, 5]
arr2 = [6, 7, 8, 9, 10]

# indexing/ reassigning index values
puts arr1[0]
puts arr2[3]
arr1[1] = 12
puts arr1 # prints each element on new line??
# +=
arr2[3] += 3 # value at index 3 + 3 and reassign to that index

# append / remove elements to arrays
# add to end of array -> shovel operator << -> push method .push()
arr1 << 100 # appends 100 to end of array
puts arr1[-1]
# remove from end of array .pop() -> returns removed element
# add to beginning of array -> .unshift() or .prepend() method
# remove from the beginning of array -> .shift()

# length of array -> .length or .size method
puts arr2.length
# join elements of array -> join method
names = %w[Des Dawn Jaz] # shorthand to prevent repeat quotes and commas -> ["Des", "Dawn", "Jaz"]
puts names.join('?')

# JavaScript forEach vs Ruby each
# array.forEach(item => {})  # JS
# array.each { |item| }     # Ruby

# concatenate arrays arr1 + arr2
puts arr1 + arr2
# subtract arrays to remove shared values
puts arr1 - arr2

# include? on array
puts names.include?('Dawn')

# arr methods for indexing -> .first , .last (they take arguments fto get first <num of ele> or last <num of ele>)
puts arr1.first(2)
puts arr2.last(4)
