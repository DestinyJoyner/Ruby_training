# Creates a hash { apple: 3, banana: 5, cherry: 2 }. Iterates over it and prints: "apple: 3" "banana: 5" "cherry: 2"

fruit = { apple: 3, banana: 5, cherry: 2 }
# each
fruit.each do |key, val|
  puts "#{key}: #{val}"
end
