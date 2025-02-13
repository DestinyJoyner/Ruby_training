# PART_8_IN_CLASS PROBLEMS

# Problem: 100_defining_multiple_class

# Instructions:
# Write a Ruby script that:
# 
# Defines a class Config.
# Uses define_singleton_method to dynamically create methods set_api_key and get_api_key.
# set_api_key(value): Stores value in a class variable.
# get_api_key: Returns the stored API key.
# Calls Config.set_api_key("123456") and then Config.get_api_key.
# 
# Output:
# API Key: 123456

# Your solution for 100_defining_multiple_class goes here:


# Problem: 101_modifying_inheritance_runtime

# Instructions:
# Write a Ruby script that:
# 
# Defines a base class Animal.
# Defines a subclass Dog < Animal.
# Modifies Dog at runtime to inherit from Mammal instead of Animal (redefining superclass).
# Calls Dog.superclass before and after modification.
# 
# Output:
# Before: Animal
# After: Mammal

# Your solution for 101_modifying_inheritance_runtime goes here:


# Problem: 95_define_method_dynamically

# Instructions:
# Write a Ruby script that:
# 
# Defines a class Person.
# Uses define_method to create two instance methods dynamically:
# greet → prints "Hello!".
# farewell → prints "Goodbye!".
# Creates an instance of Person and calls both methods.
# 
# Output:
# Hello!
# Goodbye!

# Your solution for 95_define_method_dynamically goes here:


# Problem: 96_undefined_methods

# Instructions:
# Write a Ruby script that:
# 
# Defines a class Robot.
# Overrides method*missing to handle any method call dynamically.
# If the method name starts with "say*", it prints "I am saying: <method name after 'say\_'>".
# Otherwise, calls super to raise a NoMethodError.
# Calls robot.say_hello (should work).
# Calls robot.walk (should raise an error).
# 
# Output:
# I am saying: hello
# (main.rb): undefined method `walk' for #<Robot:0x000...> (NoMethodError)

# Your solution for 96_undefined_methods goes here:


# Problem: 97_dynamically_calling_methods

# Instructions:
# Write a Ruby script that:
# 
# Defines a class Calculator with three instance methods:
# add(a, b) → returns a + b.
# subtract(a, b) → returns a - b.
# multiply(a, b) → returns a \* b.
# Calls methods dynamically using send (instead of direct method calls).
# 
# Output:
# Sum: 15
# Difference: 5
# Product: 50

# Your solution for 97_dynamically_calling_methods goes here:


# Problem: 98_singleton

# Instructions:
# Write a Ruby script that:
# 
# Defines a class Animal with a method speak that returns "Animal sound".
# The instance should return "Animal sound" instead.
# 
# Output:
# Animal sound
# Animal sound
# true

# Your solution for 98_singleton goes here:


# Problem: 99_dynamically_define_class

# Instructions:
# Write a Ruby script that:
# 
# Defines a class User.
# Uses define_singleton_method to dynamically add a class method greet that prints "Hello from User class!".
# Calls User.greet.
# 
# Output:
# Hello from User class!

# Your solution for 99_dynamically_define_class goes here: