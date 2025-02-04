#  irb in terminal
# can seperate digits with underscores
# 2000000 -> 2_000_000_000

# division if want decimal returned, need a number to be a float
puts 10 / 3
puts 10 / 3.0

# convert int to float or float to int or to string (.to_s removed when save file)
puts 3.to_f
puts 2.3.to_i
puts 'hello'

#  !=
puts 3 != 5

# spaceship operator <=> less than equal greater than ->
# -1 if the left side is less than the right side
# 0 if both sides are equal
# 1 if the left side is greater than the right side
puts 4 <=> 7

#  .times method, will run a block number of times, like iterating
5.times do
  puts 'hello world'
end

3.times do |n|
  puts "#{n}"
end

# positive negative integer methods?
puts(-1.positive?)
puts 3.negative?
