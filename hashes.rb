# JavaScript Object vs Ruby Hash
# js_object = { name: "Destiny" }
# ruby_hash = { name: "Destiny" }

# HASHES -> objects
test_hash = {
  name: 'Destiny',
  age: 24
}
# access key in hash use :<key>
puts test_hash[:name]
# update key values
test_hash[:name] = 'Dawn'
puts test_hash[:name]

#  use size method to find out how many keys inside hash
puts test_hash.size
# .keys method returns array of keys -> .values method returns array of values
puts test_hash.keys
# .delete method to remove key from hash
test_hash.delete(:age)
puts test_hash

# .dig method -> similar to ?. optional chaining to access nested values in hash
animals = {
  pets: {
    dog: {
      name: 'Spot',
      age: 3,
      toys: %w[ball bone]
    },
    cat: {
      name: 'Whiskers',
      age: 5,
      favorite_spots: {
        morning: 'windowsill',
        afternoon: 'couch'
      }
    }
  },
  wild: {
    lion: {
      name: 'Leo'
    }
  }
}

puts animals.dig(:pets, :dog, :name) # "Spot"
puts animals.dig(:pets, :cat, :favorite_spots, :morning) # "windowsill"
puts animals.dig(:pets, :fish, :name) # nil (safe - no error)
# error by directly accessing:
# animals[:pets][:fish][:name]  # Would raise NoMethodError

# Blocks? -> array iteration methods
hash_arr = animals[:pets][:dog][:toys]
hash_arr.each do |toy|
  puts toy.upcase
end

# difference btw p, puts, print?
# print - prints everything on the same line, no new line
# prints each item on a new line
# p - prints with debugging info (shows quotes for strings, etc)

# iterate over keys in hash
animals.each do |keys|
  p keys
end

animals.each do |key, val|
  puts "#{key} : #{val}"
end

hamster = {
  name: 'Shelly',
  age: 1,
  toys: %w[wheel, carrot]
}
# .merge method join hashes, like keys get overwritten -> doesn't ovverride original -> use .merge! to override original
animals[:pets].merge!(hamster)
puts animals[:pets]
