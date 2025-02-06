# Creates an array [1, 2, 3, 4, 5]. Uses each to print each element squared

arr = (1..5).to_a
arr.each do |el|
  puts el**2
end
