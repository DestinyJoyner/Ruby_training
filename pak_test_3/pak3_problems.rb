# PAK_TEST_3 PROBLEMS

# Problem: 36_blocks

# Instructions:
# Write a Ruby script that:
#
# Defines an array [1, 2, 3, 4, 5].
# Uses a block with each to print each element multiplied by 2.

# Your solution for 36_blocks goes here:
each_arr = (1..5).to_a
each_arr.each do |el|
  puts el * 2
end

# Problem: 37_do_end

# Instructions:
# Write a Ruby script that:
#
# Defines an array [10, 20, 30].
# Uses both do...end and {} block syntax to print "Value: X" for each number.

# Your solution for 37_do_end goes here:
do_arr = (10..30).step(10).to_a

do_arr.each do |val|
  puts "Value: #{val}"
end

do_arr.each { |val| puts "Value: #{val}" }

# Problem: 38_yield

# Instructions:
# Write a Ruby script that:
#
# Defines a method repeat_twice that:
# Calls yield twice inside the method.
# Calls repeat_twice with a block that prints "Hello!".

# Your solution for 38_yield goes here:
def repeat_twice
  yield
  yield
end

repeat_twice { puts 'Hello!' }

# Problem: 39_yield_parameters

# Instructions:
# Write a Ruby script that:
#
# Defines a method greet_person that yields a name to a block.
# Calls the method with a block that prints "Hello, Alice!".

# Your solution for 39_yield_parameters goes here:
# yield("Hello Destiny")  # value passed in yield method whe paused, gets subbed in for placeholder -> message (calling function with block) and executed with passed in value
# end

#  yields just the name!!
#
# single_param { |message| puts message }
def greet_person
  yield('Alice')
end

greet_person { |name| puts "Hello, #{name}!" }

# Problem: 40_block_map

# Instructions:
# Write a Ruby script that:
#
# Defines an array [1, 2, 3, 4].
# Uses .map with a block to double each number.
# Prints the new array.

# Your solution for 40_block_map goes here:
## notes
# # map method returns array
# mapped_arr = negative_nums.map { |el| el.abs }

arr = (1..4).to_a
mapped_arr = arr.map { |el| el * 2 }
puts "#{mapped_arr}"

# Problem: 41_block_yield

# Instructions:
# Write a Ruby script that:
#
# Defines a method greet that calls yield only if a block is given.
# Uses block_given? to prevent errors.
# Calls greet with and without a block.
#
# Output:
# Hello, Ruby!
# No block given.

# Your solution for 41_block_yield goes here:
def greet
  if block_given?
    yield
  else
    puts 'No block given.'
  end
end

greet { puts 'Hello, Ruby!' }
greet

# Problem: 42_customer_iterator

# Instructions:
# Write a Ruby script that:
#
# Defines a method repeat_three_times that yields to a block three times.
# Calls the method with a block that prints "Executing block!".
#
# Output:
# Executing block!
# Executing block!
# Executing block!

# Your solution for 42_customer_iterator goes here:
def repeat_three_times(&block)
  3.times(&block)
end

repeat_three_times { puts 'Executing block!' }

# Problem: 43_procs

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that prints "Hello from Proc!".
# Calls the Proc twice.
#
# Output:
# Hello from Proc!
# Hello from Proc!

# Your solution for 43_procs goes here:
#  Extra Notes: https://ruby-doc.org/core-2.6/Proc.html

greet_proc = proc { puts 'Hello from Proc!' }

greet_proc.call
greet_proc.call

# Problem: 44_procs_arguments

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that takes a name and prints "Hello, [name]!".
# Calls the Proc with "Alice" and "Bob".
#
# Output:
# Hello, Alice!
# Hello, Bob!

# Your solution for 44_procs_arguments goes here:
name_proc = proc { |name| puts "Hello, #{name}!" }
name_proc.call('Alice')
name_proc.call('Bob')

# Problem: 45_proc_call

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that doubles a number.
# Calls it using both .call() and [] syntax.
#
# Output:
# 10
# 10

# Your solution for 45_proc_call goes here:
# Notes (shorthands):
# square = Proc.new {|x| x**2 }

# square.call(3) #=> 9
# shorthands:
# square.(3)
# square[3]

square_proc = proc { |number| number * 2 }
puts square_proc.call(5)
puts square_proc[5]

# Problem: 46_proc_array

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that squares a number.
# Uses it in .map to transform [1, 2, 3, 4].
#
# Output:
# [1, 4, 9, 16]

# Your solution for 46_proc_array goes here:
map_proc = proc { |num| num * num }
proc_arr = (1..4).to_a
puts "#{proc_arr.map { |num| map_proc.call(num) }}"

# Problem: 47_handling_missing_argue

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that greets a person but has a default value ("Guest") if no argument is provided.
# Calls the Proc with "Alice" and without any argument.
#
# Output:
# Hello, Alice!
# Hello, Guest!

# Your solution for 47_handling_missing_argue goes here:

default_proc = proc { |name| puts "Hello #{name || 'Guest'}" }
default_proc.call('Alice')
default_proc.call

# Problem: 48_multiple_arguments

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that adds two numbers, using 0 as the default value if an argument is missing.
# Calls the Proc with:
# Two numbers: add.call(4, 6)
# One number: add.call(5)
#
# Output:
# 10
# 5

# Your solution for 48_multiple_arguments goes here:
multiple_proc = proc { |a = 0, b = 0| puts "#{a + b}" }
multiple_proc.call(4, 6)
multiple_proc.call(5)

# Problem: 49_handling_too_many_arguments

# Instructions:
# Write a Ruby script that:
#
# Creates a Proc that takes two arguments but uses \*args to handle extra ones.
# Calls it with:
# 2 arguments: multiply.call(3, 4)
# 4 arguments: multiply.call(2, 3, 5, 7)
#
# Output:
# Product: 12
# Extra arguments: [5, 7]

# Your solution for 49_handling_too_many_arguments goes here:
extra_arg_proc = proc do |a, b, *args|
  puts "Product: #{a * b}"
  puts "Extra arguments: #{args}" unless args.empty?
end

extra_arg_proc.call(3, 4)
extra_arg_proc.call(2, 3, 5, 7)

# Problem: 50_passing_proc_method

# Instructions:
# Write a Ruby script that:
#
# Defines a method execute_proc that takes a Proc as an argument and calls it.
# Creates a Proc that prints "Hello from Proc!".
# Passes the Proc to execute_proc.
#
# Output:
# Hello from Proc!

# Your solution for 50_passing_proc_method goes here:

def execute_proc(proc_arg)
  proc_arg.call
end
proc_arg = proc { puts 'Hello from Proc!' }

execute_proc(proc_arg)

# Problem: 51_passing_a_proc_that_takes_argument

# Instructions:
# Write a Ruby script that:
#
# Defines a method execute_with_argument that takes a Proc and a number.
# Calls the Proc, passing the number to it.
# Creates a Proc that squares a number and passes it to execute_with_argument with 5.
#
# Output:
# 25

# Your solution for 51_passing_a_proc_that_takes_argument goes here:
def execute_with_argument(proc_arg, num)
  puts proc_arg.call(num)
end

square_num_proc = proc { |n| n**2 }
puts execute_with_argument(square_num_proc, 5)

# Problem: 52_passing_multiple_procs_method

# Instructions:
# Write a Ruby script that:
#
# Defines a method process_numbers that takes two Procs and a number.
# Calls the first Proc on the number.
# Calls the second Proc on the result.
# Prints the final result.
#
# Output:
# 50

# Your solution for 52_passing_multiple_procs_method goes here:
def process_numbers(proc1, proc2, num)
  proc1_result = proc1.call(num)
  proc2_result = proc2.call(proc1_result)
  puts proc2_result
end

# Problem: 53_proc_array

# Instructions:
# Write a Ruby script that:
#
# Defines a method apply_proc_to_array that takes an array and a Proc.
# Applies the Proc using .map.
# Prints the modified array.
#
# Output:
# [2, 4, 6, 8, 10]

# Your solution for 53_proc_array goes here:
def apply_proc_to_array(arr, proc_arg)
  puts "#{arr.map { |el| proc_arg.call(el) }}"
end
