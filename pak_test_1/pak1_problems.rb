# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Takes an integer num (num = 15).
# Uses if, elsif, else to check:
# If num is greater than 10, print "15 is greater than 10".
# If num is exactly 10, print "15 is exactly 10".
# Otherwise, print "15 is less than 10".
puts 'Enter a number: '
num = gets.chomp.to_i

if num > 10
  puts "#{num} is greater than 10"
elsif num == 10
  puts "#{num} is exactly 10"
else
  puts "#{num} is less than 10"
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Initializes count = 1.
# Uses a while loop to print numbers from 1 to 5.
# Uses an until loop to print numbers from 6 to 10.

count = 1
while count <= 5
  puts count
  count += 1
end

until count > 10
  puts count
  count += 1
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Uses a for loop to iterate from 1 to 5 and print
for i in 1..5
  puts i
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Uses each to iterate over an array [1, 2, 3].
# Uses times to print "Hello" 3 times.
# Uses upto to print numbers from 1 to 3.
# Uses downto to print numbers from 3 to 1.

arr = [1, 2, 3]
arr.each do |el|
end

3.times do
  puts 'Hello'
end

1.upto(3) do |el|
  puts el
end

3.downto(1) do |el|
  puts el
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Uses a for loop to iterate from 1 to 10.
# Stops the loop when it reaches 5 using break.
# Prints each iteration before stopping.
for i in 1..10
  puts i
  break if i == 5
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Uses a for loop to iterate from 1 to 5.
# Skips number 3 using next and prints the others
for i in 1..5
  next if i == 3

  puts i
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Uses a while loop with count = 1.
# If count == 3, prints "Redoing 3" and repeats it once using redo.
# Continues printing the remaining numbers
count = 1
while count <= 4
  if count == 3
    puts 'Redoing 3'
    redo
  end
  puts count
  count += 1
end

# README Content:
#
# Instruction:
# Write a Ruby script that:
#
# Attempts division (10 / num), where num = 0.
# Catches the ZeroDivisionError and retries after setting num = 2.

# begin/rescue -> try/catch block
# can get error details using => e syntax
begin
  puts 10 / 0
rescue ZeroDivisionError
  num = 2
  retry
end

# README Content:
#
# Instruction:
# Write a Ruby script that prints "Hello, Ruby!" to the console.

puts 'Hello, Ruby!'

# README Content:
#
# Instruction:
# Write a script that asks for the user’s name and prints "Hello, [name]!".

puts 'Enter your name:'
user_name = gets.chomp
puts "Hello, #{user_name}!"

# README Content:
#
# Instruction:
# define variables for each data type and print.

# Numbers (Integer, Float), Strings, Symbols, Booleans (true/false), nil, Arrays, Hashes, Ranges
integer = 42
float = 3.14
string = 'Hello, world!'
boolean_true = true
boolean_false = false
symbol = :ruby
array = [1, 2, 3]
hash = { name: 'Alice', age: 25 }
null = nil

# .class -> type of method
puts "#{integer.class}: #{integer}"
puts "#{float.class}: #{float}"
puts "#{string.class}: #{string}"
puts "Boolean (true): #{boolean_true}"
puts "Boolean (false): #{boolean_false}"
puts "#{symbol.class}: #{symbol}"
puts "#{array.class}: #{array}"
puts "Hash: #{hash}"
puts "#{null.class}: #{null}"

# README Content:
#
# Instruction:
# create a constant variable called PI and set it to proper PI value

PI = 3.14159
puts "The value of PI is #{PI}"

# README Content:
#
# Instruction:
# Write a script that performs the following operations inside a string:
#
# +
# -
# *
# /
# %
# **
#

str = "Addition: 5 + 3 = #{5 + 3}
Subtraction: 5 - 3 = #{5 - 3}
Multiplication: 5 * 3 = #{5 * 3}
Division: 5 / 3 = #{5 / 3}
Modulus: 5 % 3 = #{5 % 3}
Exponentiation: 5 ** 3 = #{5**3} "

puts str

# README Content:
#
# Instruction:
# Write a Ruby script that compares two numbers (7 and 4) using:
#
# ==
# !=
# >
# <
# >=
# <=
#

puts "7 == 4: #{7 == 4}"
puts "7 != 4: #{7 != 4}"
puts "7 > 4: #{7 > 4}"
puts "7 < 4: #{7 < 4}"
puts "7 >= 4: #{7 >= 4}"
puts "7 <= 4: #{7 <= 4}"

# README Content:
#
# Instruction:
# Write a script that evaluates the following logical expressions:
#
# true && false
# true || false
# !true
# !(false || true)

puts "true && false: #{true && false}"
puts "true || false: #{true || false}"
puts "!true: #{!true}"
puts "!(false || true): #{!(false || true)}"

# README Content:
#
# Instruction:
# Write a script that checks whether a number (10) is even or odd using the ternary operator (? :).

puts 10.odd? ? 'Odd' : 'Even'
