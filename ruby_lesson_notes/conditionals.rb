# CONTROL FLOW - CONDITIONALS -> if, elsif, else
# if statements, ternary operators
# constants - different from variables, first letter has to be capitalized -> can be changed (with warning)

USERNAME = 'test@email.com'
PASSWORD = '123password'

puts 'Welcome to password manager'
print 'Enter email: '
# gets method -> get user input from terminal -> input() in Python

# gets method in ruby not one line like input but can use helper function to simplify:
def prompt(message)
  print message
  gets.chomp
end

# Now you can use it like Python's input()
name = prompt("What's your name? ")
age = prompt('How old are you? ')

user_email = gets.chomp # removes newline character from user input when press enter
# p user_email
puts user_email

# if/else statements
# if <conditional>
#   <code to execute>
# end

# == strictly equal
if user_email == USERNAME
  print 'Enter Password: '
  user_password = gets.chomp
else
  puts 'invalid email'
end
# conditional blocks share scope: so user_password is accessible in next if statement although defined in block above
#  "modifier if" or "postfix if" -> concise way to write a single-line conditional.
puts 'logging in...' if user_password == PASSWORD

# unless keyword -> usually doesn't have else conditional but can be used -> if need else just use if (positive conditional)

unless user_password != PASSWORD
  # always run the code inside unless conditional is true
  puts "Welcome back, #{user_email}!"
end

# exit keyword is like 'break' keyword or return to stop program

# CASE STATEMENT like JS switch
# used to check against When statements -> no need for break statements, Ruby has no fall through
# grade = 'A'
case grade
when 'A'
  puts 'Excellent!'
when 'B'
  puts 'Good job!'
when 'C', 'D' # Multiple conditions in one when
  puts 'You need to study more'
else
  puts 'Invalid grade'
end

# when taking user input (or a string) value to then use in order to key into a hash-> hash["string"] wont work -> need to convert string to symbol -> hash[:symbol]
# use to_sym method on the str
str_hash = {
  name: 'Test',
  age: 24
}
str1 = 'name'
puts str_hash[str1.to_sym]
puts str_hash[:name]

#  TERNARY OPERATOR -> similar to JS  <conditional> : <true return this> : <else return this>
#  user_password == PASSWORD ? puts('logging in...') : puts('wrong password')
