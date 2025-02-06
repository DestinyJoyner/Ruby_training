# Creates an array of five numbers: [10, 20, 30, 40, 50]. Prints the first and last elements.

# Converting a range directly to an array -> (1..5).to_a
arr = Array (10..50).step(10).to_a
puts "First Element: #{arr[0]}"
puts "Last Element: #{arr[-1]}"
