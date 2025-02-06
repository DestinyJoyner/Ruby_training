# Creates a hash with different key types:

# { "name" => "Alice", 1 => "Number Key", :symbol_key => "Symbol Key", [1, 2, 3] => "Array Key" }

# Prints each key-value pair.

# hash rocket syntax
hash = {
  'name' => 'Alice',
  1 => 'Number Key',
  :symbol_key => 'Symbol Key',
  [1, 2, 3] => 'Array Key'
}

hash.each do |key, val|
  puts "#{key}: #{val}"
end
