# LOOPS & BLOCKS

# loop do
#   put 'im looping'
# end

# can use times method that takes a block
10.times do
  puts 'times method'
end

# upto method -> range -> curly brace block method to grab iterator
# also downto method
1.upto(10) do
  puts 'counting up'
end

5.upto(12) { |n| puts n }

# while loops
num = 5
while num <= 10
  puts 'not greater than 10 yet'
  num += 1
end
puts "#{num} is greater than 10"

num2 = 3
# until loops
until num2 > 10
  puts 'not ten yet'
  num2 += 1
end
puts "#{num2} is greater than 10"

# loop through arrays
# each method
nums = [1, 2, 3, 4, 5]
# one line curly brace syntax
nums.each { |val| puts val }
# multi line code block use do syntax
nums.each do |val|
  puts val
end

negative_nums = [-1, -2, -3, -4, -5]
# map method returns array
mapped_arr = negative_nums.map { |el| el.abs }
puts "mapped #{mapped_arr}"

# methods that take code blocks as arguments -> JS callbacks
# &block converts the block to a Proc, but you use yield -> Invokes the passed block with the given arguments
# def some_nums_yield(arr_nums)
# arr_nums.each {|num| yield(num)}
# end
def some_nums_yield(arr_nums, &block)
  arr_nums.each(&block)
end

# With & you're expecting a Proc object directly and can use call
def some_nums(arr_nums, &code_block)
  arr_nums.each { |num| code_block.call(num) }
end

# when calling, not included in function parenthesis -> use do keyword followed by code block code
some_nums(negative_nums) do |num|
  puts num + 10
end

# Proc Objects -> Proc.new -> variable that holds function -> store a block of code in a variable that you can call later -> need to use call method when call proc object (variable)
print_capitalize_name = proc { |name| puts name.capitalize }
print_capitalize_name.call('destiny')

# using proc object as callback for array methods -> &
%w[destiny dawn jaz].each(&print_capitalize_name)

# symbol to proc syntax -> using built in method capitalize
capital_arr = %w[destiny dawn jaz].map(&:capitalize)
puts "#{capital_arr}"

# use block_given? method to check if block is passed in method to avoid errors. -> if no block given original val returned
def check_block(arr_nums, &code_block)
  arr_nums.each { |num| code_block.call(num) if block_given? }
end
puts check_block(negative_nums)

# Lambda - similar to Proc object -> lambda syntax = -> use call method to run
# Lambda syntax
# double = lambda { |x| x * 2 }
# or modern syntax
double = ->(x) { x * 2 }

# Proc syntax
# double_proc = Proc.new { |x| x * 2 }
double_proc = proc { |x| x * 2 }

# Using with array methods - both work similarly
numbers = [1, 2, 3]

# With lambda
numbers.map(&double)
# Lambda = Strict function (like JavaScript arrow function)
# const strict = (x, y) => x + y;  // Requires both args

# With Proc
numbers.map(&double_proc)
# Proc = More flexible function -> no need for all args
# function flexible(x, y) {
# return (x || 0) + (y || 0);
# }

# use call method to run -> passing arg -> () outside curly braces for lambda,->|| inside curly braces for proc
test_lambda = ->(name) { puts "lambda #{name}" }
test_proc = proc { |name| puts "proc #{name}" }

test_lambda.call('Destiny') # needs argument or error
test_proc.call # forgiving without argument

# Lambda and Proc objects handle return keywords
def lambda_return
  puts 'inside code block'
  l = -> { 5 }
  l.call
  puts 'after lamda call'
end

def proc_return
  puts 'inside code block'
  p = proc { return 5 } # Proc return exits the entire method
  p.call
  puts 'after proc call' # this wont print
end

lambda_return
proc_return
