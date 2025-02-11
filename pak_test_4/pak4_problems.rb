# PART_4_IN_CLASS

# Problem: 55_lambda

# Instructions:
# Write a Ruby script that:
#
# Creates a lambda that prints "Hello from Lambda!".
# Calls the lambda twice.
#
# Output:
# Hello from Lambda!
# Hello from Lambda!

# Your solution for 55_lambda goes here:
put_lambda = -> { puts 'Hello from Lambda!' }
put_lambda.call
put_lambda.call

# Problem: 56_lambda_passing_multiple_lambdas

# Instructions:
# Write a Ruby script that:
#
# Defines a method process_numbers that takes two lambdas and a number.
# Calls the first lambda on the number.
# Calls the second lambda on the result.
# Prints the final result.
#
# Output:
# 50

# Your solution for 56_lambda_passing_multiple_lambdas goes here:
def process_numbers(lam1, lam2, num)
  lam1_result = lam1.call(num)
  lam2_result = lam2.call(lam1_result)
  puts lam2_result
end

# Problem: 57_lambda_map

# Instructions:
# Write a Ruby script that:
#
# Defines a method apply_lambda_to_array that takes an array and a lambda.
# Applies the lambda using .map.
# Prints the modified array.
#
# Output:
# [2, 4, 6, 8, 10]

# Your solution for 57_lambda_map goes here:
def apply_lambda_to_array(arr, lambda_arg)
  puts "#{arr.map { |el| lambda_arg.call(el) }}"
end

# Problem: 58_storing_multiple_lambdas_in_a_hash

# Instructions:
# Write a Ruby script that:
#
# Defines a hash of lambdas, where:
# :double multiplies a number by 2.
# :square squares a number.
# :negate negates a number.
# Calls each lambda with the number 4 and prints the result.
#
# Output:
# 8
# 16
# -4

# Your solution for 58_storing_multiple_lambdas_in_a_hash goes here:
lambda_hash = {
  double: ->(num) { num * 2 },
  square: ->(num) { num**2 },
  negate: ->(num) { num * -1 }
}
# loop?
lambda_hash.each_value do |val|
  puts "#{val.call(4)}"
end

# Problem: 59_passing_a_lambda_that_returns_another_lambda

# Instructions:
# Write a Ruby script that:
#
# Defines a method select_lambda that returns a lambda based on the operation name (:add, :multiply).
# Calls the returned lambda with two numbers (3 and 5).
#
# Output:
# 8
# 15

# Your solution for 59_passing_a_lambda_that_returns_another_lambda goes here:
def select_lambda(operation_name)
  # switch case
  case operation_name
  when :add
    ->(x, y) { x + y }
  when :multiply
    ->(x, y) { x * y }
  end
end

puts "#{select_lambda(:add).call(3, 5)}"
puts "#{select_lambda(:multiply).call(3, 5)}"

# Problem: 60_using_lambdas_inside_an_enumerator

# Instructions:
# Write a Ruby script that:
#
# Creates a lambda that increments a number by 1.
# Uses it inside an enumerator that generates the first 5 numbers starting from 1.
#
# Output:
# [1, 2, 3, 4, 5]

# Your solution for 60_using_lambdas_inside_an_enumerator goes here:
# NOTES:
# Enumerator generates values one at a time
# Yielder: a special object that collects values to be returned by the Enumerator.
# yielder << value adds value to object
# enum = Enumerator.new do |yielder|
# count = 0
# loop do
#   yielder << count
#   count += 1
# end
# end
increment_lambda = ->(n) { n + 1 }

enum = Enumerator.new do |yielder|
  num = 1
  5.times do
    yielder << num
    num = increment_lambda.call(num)
  end
end
puts "#{enum.to_a}"
# Problem: 61_procs_vs_lambdas

# Instructions:
# Both Lambdas and Procs allow passing reusable blocks of code in Ruby, but they have key differences in argument handling, return behavior, and flexibility.
#
# 1. Argument Handling
# Lambdas enforce strict argument checking.
# Procs allow missing arguments and assign nil by default.
#
# Example: Lambda vs Proc with Missing Arguments
#
# strict_lambda = ->(x, y) { puts "#{x} and #{y}" }
# flexible_proc = Proc.new { |x, y| puts "#{x} and #{y}" }
#
# strict_lambda.call(1)  # Error: Wrong number of arguments (expected 2, got 1)
# flexible_proc.call(1)  # Output: "1 and " (second argument defaults to nil)
#
# Lambdas require the exact number of arguments, while Procs don't complain if arguments are missing.
#
# 2. Return Behavior
# Lambdas return only from themselves
# Procs return from the entire method they are inside
#
# def test_lambda
#   l = -> { return "Lambda finished" }
#   l.call
#   "Method finished"
# end
#
# def test_proc
#   p = Proc.new { return "Proc finished" }
#   p.call
#   "Method finished"
# end
#
# puts test_lambda  # Output: "Method finished"
# puts test_proc    # Output: "Proc finished" (exits method early!)

# Your solution for 61_procs_vs_lambdas goes here:

# Notes:
# Lambda's return is contained - like a submenu returning to the main menu
# Proc's return is method-wide - like hitting the exit button on the whole program
# Code after a lambda.call will execute
# Code after a proc.call might never execute
