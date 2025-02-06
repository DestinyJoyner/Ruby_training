# Creates a hash representing a person: name is Alice, city is New York Prints "Alice is 25 years old and lives in New York." using hash access.

person = {
  name: 'Alice',
  city: 'New York',
  age: 25
}

puts "#{person[:name]} is #{person[:age]} years old and lives in #{person[:city]}."
