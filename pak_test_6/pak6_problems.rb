# PART_6_IN_CLASS

# Problem: 84_subclass_inheritance

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Animal with:
# An instance method speak that prints "The animal makes a sound.".
# Defines a subclass Dog that inherits from Animal.
# Creates an instance of Dog and calls speak.
#
# Output:
# The animal makes a sound.

# Your solution for 84_subclass_inheritance goes here:
class Animal
  def speak
    puts 'The animal makes a sound.'
  end
end

class Dog < Animal
end

dog1 = Dog.new
dog1.speak

# Problem: 85_overriding_method_subclass

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Vehicle with:
# An instance method describe that prints "This is a vehicle.".
# Defines a subclass Car that inherits from Vehicle.
# Overrides the describe method to print "This is a car.".
# Creates an instance of Car and calls describe.
#
# Output:
# This is a car.

# Your solution for 85_overriding_method_subclass goes here:
class Vehicle
  def describe
    puts 'This is a vehicle.'
  end
end

class Car < Vehicle
  def describe
    puts 'This is a car.'
  end
end

car1 = Car.new
car1.describe

# Problem: 86_calling_parent_method_from_subclass

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Employee with:
# A method work that prints "Employee is working.".
# Defines a subclass Manager that inherits from Employee.
# Overrides work and calls the parent method inside it.
# Creates an instance of Manager and calls work.
#
# Output:
# Employee is working.
# Manager is overseeing work.

# Your solution for 86_calling_parent_method_from_subclass goes here:
class Employee
  def work
    puts 'Employee is working.'
  end
end

class Manager < Employee
  def work
    super
    puts 'Manager is overseeing work.'
  end
end

manager1 = Manager.new
manager1.work

# Problem: 87_understanding_method_resolution_order

# Instructions:
# Write a Ruby script that:
#
# Defines a base class A with a method greet that prints "Hello from A".
# Defines a subclass B < A that overrides greet with "Hello from B".
# Defines a subclass C < B that overrides greet with "Hello from C".
# Creates an instance of C and calls greet.
#
# Output:
# Hello from C

# Your solution for 87_understanding_method_resolution_order goes here:
class A
  def greet
    puts 'Hello from A.'
  end
end

class B < A
  def greet
    puts 'Hello from B.'
  end
end

class C < B
  def greet
    puts 'Hello from C.'
  end
end

letter_c = C.new
letter_c.greet

# Problem: 88_super_multi_levels_inheritance

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Person with a method introduce that prints "I am a person.".
# Defines a subclass Employee < Person that overrides introduce and calls super, adding "I also work.".
# Defines a subclass Manager < Employee that overrides introduce and calls super, adding "I manage a team.".
# Creates a Manager instance and calls introduce.
#
# Output:
# I am a person.
# I also work.
# I manage a team.

# Your solution for 88_super_multi_levels_inheritance goes here:
class Person
  def introduce
    puts 'I am a person.'
  end
end

class EmployeeSub < Person
  def introduce
    super
    puts 'I also work.'
  end
end

class ManagerSub < EmployeeSub
  def introduce
    super
    puts 'I manage a team.'
  end
end

manager_subclass = ManagerSub.new
manager_subclass.introduce

# Problem: 89_mixing_in_modules_multiple_inheritance

# Instructions:
# Write a Ruby script that:
#
# Defines a module Flyable with a method fly that prints "I can fly!".
# Defines a base class Bird with a method speak that prints "Tweet tweet!".
# Defines a subclass Eagle < Bird that includes Flyable.
# Creates an Eagle instance and calls both speak and fly.
#
# Output:
# Tweet tweet!
# I can fly!

# Your solution for 89_mixing_in_modules_multiple_inheritance goes here:
module Flyable
  def fly
    puts 'I can fly!'
  end
end

class Bird
  def speak
    puts 'Tweet tweet!'
  end
end

class Eagle < Bird
  include Flyable
end

bald = Eagle.new
bald.speak
bald.fly

# Problem: 90_extend_class

# Instructions:
# Write a Ruby script that:
#
# Defines a module Logger with:
# A method log_message that prints "Logging from module.".
# Defines a class Application that extends Logger.
# Calls Application.log_message.
#
# Output:
# Logging from module.

# Your solution for 90_extend_class goes here:
module Logger
  def log_message
    puts 'Logging from module.'
  end
end

class Application
  extend Logger
end

Application.log_message

# Problem: 91_prepend_override_methods

# Instructions:
# Write a Ruby script that:
#
# Defines a module Logger with:
# An instance method log that prints "Logging from instance method.".
# A class method log_class_message that prints "Logging from class method.".
# Defines a module MessageModifier with:
# A method display_message that prints "Message from module.".
# Defines a class Service that:
# Includes Logger for instance methods.
# Extends Logger for class methods.
# Prepends MessageModifier to override its own display_message method.
# Calls Service.log_class_message, Service.new.log, and Service.new.display_message.
#
# Output:
# Logging from class method.
# Logging from instance method.
# Message from module.

# Your solution for 91_prepend_override_methods goes here:

# test looking for AppLogger module name
module LoggerPrepend
  # instance method (available when included)
  def log
    puts 'Logging from instance method.'
  end

  # class method (defined in self block)
  module ClassMethods
    def log_class_message
      puts 'Logging from class method.'
    end
  end

  # this automatically extends ClassMethods when Logger is included
  def self.included(base)
    base.extend(ClassMethods)
  end
end

module MessageModifier
  def display_message
    puts 'Message from module'
  end
end

class Service
  include LoggerPrepend

  # extend LoggerPrepend
  # Adds instance methods (takes precedence)
  prepend MessageModifier

  def display_message
    puts "Won't be called becasue of prepend MessageModifier"
  end
end

Service.log_class_message
Service.new.log
Service.new.display_message

# Problem: 92_polymorphism

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Shape with:
# A method area that prints "Calculating area...".
# Defines two subclasses Circle and Rectangle, each:
# Overrides area to provide specific implementations.
# Creates instances of Circle and Rectangle, then calls area.
#
# Output:
# Calculating area of a circle...
# Calculating area of a rectangle...

# Your solution for 92_polymorphism goes here:
class Shape
  def area
    puts 'Calculating area...'
  end
end

class Circle < Shape
  def area
    puts 'Calculating area of a circle...'
  end
end

class Rectangle < Shape
  def area
    puts 'Calculating area of a rectangle...'
  end
end

circle1 = Circle.new
rectangle1 = Rectangle.new
circle1.area
rectangle1.area

# Problem: 93_duck_typing

# Instructions:
# Write a Ruby script that:
#
# Defines two unrelated classes Car and Bicycle.
# Both classes implement a method move:
# Car#move prints "Car is driving...".
# Bicycle#move prints "Bicycle is pedaling...".
# Defines a method travel that accepts any object and calls move.
# Calls travel with a Car and a Bicycle.
#
# Output:
# Car is driving...
# Bicycle is pedaling...

# Your solution for 93_duck_typing goes here:
class Car
  def move
    puts 'Car is driving...'
  end
end

class Bicycle
  def move
    puts 'Bicycle is pedaling...'
  end
end

def travel(obj)
  obj.move
end
car_travel = Car.new
bike_travel = Bicycle.new

travel(car_travel)
travel(bike_travel)
# Problem: 94_interfaces

# Instructions:
# Write a Ruby script that:
#
# Defines two unrelated classes Dog and Robot, both implementing speak.
# Dog#speak prints "Woof woof!".
# Robot#speak prints "Beep boop!".
# Defines a method introduce that calls speak on any object.
# Calls introduce with both a Dog and a Robot.
#
# Output:
# Woof woof!
# Beep boop!

# Your solution for 94_interfaces goes here:
class Dog
  def speak
    puts 'Woof woof!'
  end
end

class Robot
  def speak
    puts 'Beep boop!'
  end
end

def introduce(obj)
  obj.speak
end

dog_speak = Dog.new
robot_speak = Robot.new

introduce(dog_speak)
introduce(robot_speak)
