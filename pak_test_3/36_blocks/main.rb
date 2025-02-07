# Defines an array [1, 2, 3, 4, 5]. Uses a block with each to print each element multiplied by 2.

arr = (1..5).to_a
arr.each do |el|
  puts el * 2
end
