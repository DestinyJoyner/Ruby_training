# Creates a hash {c: 3, a: 1, b: 2}. Sorts it by keys and prints the sorted hash.

hash = { c: 3, a: 1, b: 2 }
# sort -> returns arr of arrs -> turn back to hash
sorted_hash = hash.sort.to_h

puts sorted_hash
