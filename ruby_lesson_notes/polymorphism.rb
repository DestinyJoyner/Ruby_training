# POLYMORPHISM
# "many forms" - it's when different classes can respond to the same method name in their own way

# EXAMPLE
#
## Different classes responding to the same 'speak' method
class Dog
  def speak
    puts 'Woof!'
  end
end

class Cat
  def speak
    puts 'Meow!'
  end
end

class Duck
  def speak
    puts 'Quack!'
  end
end

# All these animals can 'speak' but do it differently
animals = [Dog.new, Cat.new, Duck.new]

animals.each do |animal|
  animal.speak # Each animal speaks in its own way
end

# Output:
# Woof!
# Meow!
# Quack!
