# Creates a hash { name: "Alice" }. Tries to fetch the "age" key, handling the missing key by returning "Unknown".

person = { name: 'Alice' }
# fetch method like python gets
puts person.fetch('age', 'Unknown')
