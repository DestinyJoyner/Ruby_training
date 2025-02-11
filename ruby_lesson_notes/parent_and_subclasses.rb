# using super keyword:
# super - calls parent method with same arguments
# super() - calls parent method with no arguments
# super(arg1, arg2) - calls parent method with specific arguments

# uses:
# Extending parent behavior
# Initializing parent attributes
# Reusing parent logic

# EXAMPLE
# Using super keyword
class Animal
  def speak
    puts 'Some generic sound'
  end

  def introduce
    puts 'I am an animal'
  end
end

class Dog < Animal
  def speak
    super # Calls Animal's speak method
    puts 'Woof!' # Then does its own thing
  end

  def introduce
    puts 'I am a dog and...'
    super # Calls Animal's introduce method
  end
end

# Using explicit parent class name
class Cat < Animal
  def speak
    Animal.instance_method(:speak).bind(self).call # Rarely used
    puts 'Meow!'
  end
end

# Using super with arguments
class Pet < Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts "My name is #{@name}"
  end
end

class Hamster < Pet
  def initialize(name, wheel_size)
    super(name) # Calls Pet's initialize with name
    @wheel_size = wheel_size
  end
end
