# Classes
# Can create instances (objects)
# Can inherit from one parent class
# Used for objects that need state (instance variables)

# Modules
# Cannot create instances
# Can be mixed into multiple classes (shared behavior)
# Used for grouping related methods (like a toolbox)

# Include, Prepend, Extend
# include - adds instance methods
# include puts methods behind class methods
# extend - adds class methods
# extend adds methods to the class itself
# prepend - adds instance methods that override the class's methods
# prepend puts methods in front (overrides class methods)

# MODULE EXAMPLE (use include or extend keyword)

# Module definition
module Swimmable
  def swim
    puts "I'm swimming!"
  end

  def float
    puts "I'm floating!"
  end
end

# Using module in classes
class Duck
  include Swimmable  # Mix in swimming abilities
end

class Fish
  include Swimmable  # Same swimming abilities
end

# Usage
duck = Duck.new
duck.swim   # => "I'm swimming!"

fish = Fish.new
fish.swim   # => "I'm swimming!"

# Common real-world example
module MathHelper
  def square(x)
    x * x
  end

  def double(x)
    x * 2
  end
end

class Calculator
  include MathHelper # Now has access to math methods
end
