# METHODS AND FUNCTIONS
# define method with def keyword close with end keyword

def say_hello(name)
  puts "Hello #{name}"
end

say_hello('Destiny')

# return keyword -> Ruby automatically returns the last evaluated expression in a method so return keyword is optional -> unless early return is used (followed by other conditionals if not true) -> if block always needs the end statement after else

def check_age(age)
  return 'Invalid age' if age < 0 # Early return

  if age < 18
    "You're a minor"    # Implicit return
  else
    "You're an adult"   # Implicit return
  end
end

puts(check_age(-1))
puts(check_age(10))
puts(check_age(30))

def test_return
  2 + 2
  puts 'test'
  6 * 3 # 18 will be returned from this method
end

puts(test_return)

# KEYWORD ARGUMENTS -> when call method, use keywords and have them point to values to be used for them, arguments not order dependent -> can also add on to set default values -> greeting:"Good Morning"
def talk(greeting:, name:)
  puts "#{greeting} #{name}"
end

# talk('Good Morning', 'Destiny') # throws error incorrect
talk(greeting: 'Good Morning', name: 'Destiny')
