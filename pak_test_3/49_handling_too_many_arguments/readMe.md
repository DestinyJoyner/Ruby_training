Instruction:
Write a Ruby script that:

Creates a Proc that takes two arguments but uses \*args to handle extra ones.
Calls it with:
2 arguments: multiply.call(3, 4)
4 arguments: multiply.call(2, 3, 5, 7)

Output:
Product: 12
Extra arguments: [5, 7]

===================
HOW TO RUN TEST?

1. installation

gem install minitest

2. how to run the test?
   ruby main_test.rb
