# Creates a hash { name: "Alice", age: 25 }. Adds "city: New York" to the hash. Updates "age" to 26. Removes "name". Prints the final hash.

person = { name: 'Alice', age: 25 }

person[:city] = 'New York'
person[:age] = 26
person.delete(:name)

puts person
