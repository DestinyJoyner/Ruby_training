# Both Lambdas and Procs allow passing reusable blocks of code in Ruby, but they have key differences in argument handling, return behavior, and flexibility.
#
# 1. Argument Handling
# Lambdas enforce strict argument checking.
# Procs allow missing arguments and assign nil by default.
#
# Example: Lambda vs Proc with Missing Arguments
#
strict_lambda = ->(x, y) { puts "#{x} and #{y}" }
flexible_proc = proc { |x, y| puts "#{x} and #{y}" }
#
strict_lambda.call(1)  # Error: Wrong number of arguments (expected 2, got 1)
flexible_proc.call(1)  # Output: "1 and " (second argument defaults to nil)
#
# Lambdas require the exact number of arguments, while Procs don't complain if arguments are missing.
#
# 2. Return Behavior
# Lambdas return only from themselves
# Procs return from the entire method they are inside
#
def test_lambda
  l = -> { 'Lambda finished' }
  l.call
  'Method finished'
end

def test_proc
  p = proc { return 'Proc finished' }
  p.call
  'Method finished'
end
#
puts test_lambda  # Output: "Method finished"
puts test_proc    # Output: "Proc finished" (exits method early!)

# Notes:
# Lambda's return is contained - like a submenu returning to the main menu
# Proc's return is method-wide - like hitting the exit button on the whole program
# Code after a lambda.call will execute
# Code after a proc.call might never execute
