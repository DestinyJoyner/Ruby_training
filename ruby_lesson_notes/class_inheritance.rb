# INHERITANCE
# Use < to inherit from parent class
# Child classes get all parent methods
# Can override parent methods
# Can add new methods specific to child class
# Child classes inherit instance variables
#

# EXAMPLE
# Parent/Super class
class Pet
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    puts 'Some generic pet noise'
  end

  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old!"
  end
end

# Child/Sub classes
class Dog < Pet
  def speak  # Override the parent's speak method
    puts 'Woof! Woof!'
  end

  def fetch
    puts "#{@name} is fetching the ball!"
  end
end

class Cat < Pet
  def speak  # Override the parent's speak method
    puts 'Meow!'
  end

  def scratch
    puts "#{@name} is scratching the post!"
  end
end

# Using the classes
dog = Dog.new('Buddy', 3)
cat = Cat.new('Whiskers', 5)

# Both can use Pet methods
dog.introduce  # => "Hi, I'm Buddy and I'm 3 years old!"
cat.introduce  # => "Hi, I'm Whiskers and I'm 5 years old!"

# Each has its own speak method
dog.speak      # => "Woof! Woof!"
cat.speak      # => "Meow!"

# Specific methods for each type
dog.fetch      # => "Buddy is fetching the ball!"
cat.scratch    # => "Whiskers is scratching the post!"
