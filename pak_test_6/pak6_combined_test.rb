# PART_6_IN_CLASS

# Folder: 84_subclass_inheritance

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestAnimalInheritance < Minitest::Test
  def setup
    assert defined?(Animal), "Expected class 'Animal' to be defined."
    assert defined?(Dog), "Expected class 'Dog' to be defined."
    assert Dog < Animal, "Expected 'Dog' to inherit from 'Animal'."
  end

  def test_dog_inherits_speak
    output = StringIO.new
    $stdout = output

    dog = Dog.new
    dog.speak

    $stdout = STDOUT

    expected_output = "The animal makes a sound.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 85_overriding_method_subclass

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestVehicleInheritance < Minitest::Test
  def setup
    assert defined?(Vehicle), "Expected class 'Vehicle' to be defined."
    assert defined?(Car), "Expected class 'Car' to be defined."
    assert Car < Vehicle, "Expected 'Car' to inherit from 'Vehicle'."
  end

  def test_car_overrides_describe
    output = StringIO.new
    $stdout = output

    car = Car.new
    car.describe

    $stdout = STDOUT

    expected_output = "This is a car.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 86_calling_parent_method_from_subclass

require 'minitest/autorun'
require_relative 'main'

class TestEmployeeInheritance < Minitest::Test
  def setup
    assert defined?(Employee), "Expected class 'Employee' to be defined."
    assert defined?(Manager), "Expected class 'Manager' to be defined."
    assert Manager < Employee, "Expected 'Manager' to inherit from 'Employee'."
  end

  def test_manager_calls_super
    output = StringIO.new
    $stdout = output

    manager = Manager.new
    manager.work

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Employee is working.
      Manager is overseeing work.
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 87_understanding_method_resolution_order

require 'minitest/autorun'
require_relative 'main'

class TestMethodResolutionOrder < Minitest::Test
  def setup
    assert defined?(A), "Expected class 'A' to be defined."
    assert defined?(B), "Expected class 'B' to be defined."
    assert defined?(C), "Expected class 'C' to be defined."
    assert C < B && B < A, "Expected 'C' to inherit from 'B' and 'B' from 'A'."
  end

  def test_c_greet
    output = StringIO.new
    $stdout = output

    c = C.new
    c.greet

    $stdout = STDOUT

    expected_output = "Hello from C\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 88_super_multi_levels_inheritance

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestSuperMethod < Minitest::Test
  def setup
    assert defined?(Person), "Expected class 'Person' to be defined."
    assert defined?(Employee), "Expected class 'Employee' to be defined."
    assert defined?(Manager), "Expected class 'Manager' to be defined."
    assert Manager < Employee && Employee < Person,
           "Expected 'Manager' to inherit from 'Employee' and 'Employee' from 'Person'."
  end

  def test_manager_introduce
    output = StringIO.new
    $stdout = output

    manager = Manager.new
    manager.introduce

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      I am a person.
      I also work.
      I manage a team.
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 89_mixing_in_modules_multiple_inheritance

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestModuleInheritance < Minitest::Test
  def setup
    assert defined?(Flyable), "Expected module 'Flyable' to be defined."
    assert defined?(Bird), "Expected class 'Bird' to be defined."
    assert defined?(Eagle), "Expected class 'Eagle' to be defined."
    assert Eagle < Bird, "Expected 'Eagle' to inherit from 'Bird'."
    assert Eagle.include?(Flyable), "Expected 'Eagle' to include module 'Flyable'."
  end

  def test_eagle_methods
    output = StringIO.new
    $stdout = output

    eagle = Eagle.new
    eagle.speak
    eagle.fly

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Tweet tweet!
      I can fly!
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 90_extend_class

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestExtendModule < Minitest::Test
  def setup
    assert defined?(AppLogger), "Expected module 'AppLogger' to be defined."
    assert defined?(Application), "Expected class 'Application' to be defined."
    assert Application.singleton_class.include?(AppLogger), "Expected 'Application' to extend 'AppLogger'."
  end

  def test_log_message
    output = StringIO.new
    $stdout = output

    Application.log_message

    $stdout = STDOUT

    expected_output = "Logging from module.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 91_prepend_override_methods

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestModuleCombinations < Minitest::Test
  def setup
    assert defined?(AppLogger), "Expected module 'AppLogger' to be defined."
    assert defined?(MessageModifier), "Expected module 'MessageModifier' to be defined."
    assert defined?(Service), "Expected class 'Service' to be defined."
    assert Service.singleton_class.include?(AppLogger), "Expected 'Service' to extend 'AppLogger'."
    assert Service.ancestors.first == MessageModifier, "Expected 'MessageModifier' to be prepended to 'Service'."
    assert Service.include?(AppLogger), "Expected 'AppLogger' to be included in 'Service'."
  end

  def test_combined_behavior
    output = StringIO.new
    $stdout = output

    Service.log_class_message
    service = Service.new
    service.log
    service.display_message

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Logging from class method.
      Logging from instance method.
      Message from module.
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 92_polymorphism

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestPolymorphism < Minitest::Test
  def setup
    assert defined?(Shape), "Expected class 'Shape' to be defined."
    assert defined?(Circle), "Expected class 'Circle' to be defined."
    assert defined?(Rectangle), "Expected class 'Rectangle' to be defined."
    assert Circle < Shape, "Expected 'Circle' to inherit from 'Shape'."
    assert Rectangle < Shape, "Expected 'Rectangle' to inherit from 'Shape'."
  end

  def test_area_method
    output = StringIO.new
    $stdout = output

    circle = Circle.new
    rectangle = Rectangle.new

    circle.area
    rectangle.area

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Calculating area of a circle...
      Calculating area of a rectangle...
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 93_duck_typing

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestDuckTyping < Minitest::Test
  def setup
    assert defined?(Car), "Expected class 'Car' to be defined."
    assert defined?(Bicycle), "Expected class 'Bicycle' to be defined."
  end

  def test_travel_with_different_objects
    output = StringIO.new
    $stdout = output

    car = Car.new
    bike = Bicycle.new

    travel(car)
    travel(bike)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Car is driving...
      Bicycle is pedaling...
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 94_interfaces

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestDuckTypingInterface < Minitest::Test
  def setup
    assert defined?(Dog), "Expected class 'Dog' to be defined."
    assert defined?(Robot), "Expected class 'Robot' to be defined."
  end

  def test_introduce_with_different_objects
    output = StringIO.new
    $stdout = output

    dog = Dog.new
    robot = Robot.new

    introduce(dog)
    introduce(robot)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Woof woof!
      Beep boop!
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end
