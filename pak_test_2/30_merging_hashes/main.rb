# Creates two hashes: { a: 1, b: 2 } and { b: 3, c: 4 } Merges them into one hash. Prints the final hash.

hash_1 = { a: 1, b: 2 }
hash_2 = { b: 3, c: 4 }
# merge and merge!
hash_1.merge!(hash_2)
puts hash_1
