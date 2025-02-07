# Defines an array [10, 20, 30]. Uses both do...end and {} block syntax to print "Value: X" for each number.

arr = (10..30).step(10).to_a

arr.each do |val|
  puts "Value: #{val}"
end

arr.each { |val| puts "Value: #{val}" }
