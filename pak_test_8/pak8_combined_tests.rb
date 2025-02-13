# PART_8_IN_CLASS TESTS

# Folder: 100_defining_multiple_class

require "minitest/autorun"
require_relative "main"

class TestConfigClass < Minitest::Test
  def test_api_key_methods
    Config.set_api_key("123456")
    output = StringIO.new
    $stdout = output

    Config.get_api_key

    $stdout = STDOUT

    expected_output = "API Key: 123456"
    assert_equal expected_output, output.string.strip, "Expected 'API Key: 123456' but got #{output.string.strip}."
  end
end

# Folder: 101_modifying_inheritance_runtime

require "minitest/autorun"
require_relative "main"

class TestModifyInheritance < Minitest::Test
  def test_superclass_change
    assert_equal Animal, Dog.superclass, "Expected initial superclass to be 'Animal'."

    Dog.singleton_class.class_eval do
      class << self
        def inherited(subclass)
          subclass.singleton_class.send(:remove_const, :SUPERCLASS) if subclass.const_defined?(:SUPERCLASS)
          subclass.const_set(:SUPERCLASS, Mammal)
        end
      end
    end

    assert_equal Mammal, Dog.superclass, "Expected modified superclass to be 'Mammal'."
  end
end

# Folder: 95_define_method_dynamically

require "minitest/autorun"
require_relative "main"

class TestDefineMethod < Minitest::Test
  def setup
    @person = Person.new
  end

  def test_greet
    output = StringIO.new
    $stdout = output

    @person.greet

    $stdout = STDOUT

    expected_output = "Hello!"
    assert_equal expected_output, output.string.strip, "Expected 'Hello!' but got #{output.string.strip}."
  end

  def test_farewell
    output = StringIO.new
    $stdout = output

    @person.farewell

    $stdout = STDOUT

    expected_output = "Goodbye!"
    assert_equal expected_output, output.string.strip, "Expected 'Goodbye!' but got #{output.string.strip}."
  end
end

# Folder: 96_undefined_methods

require "minitest/autorun"
require_relative "main"
require 'stringio'

class TestMethodMissing < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_say_hello
    output = StringIO.new
    $stdout = output

    @robot.say_hello

    $stdout = STDOUT

    expected_output = "I am saying: hello"
    assert_equal expected_output, output.string.strip, "Expected 'I am saying: hello' but got #{output.string.strip}."
  end

  def test_invalid_method
    assert_raises(NoMethodError) { @robot.walk }
  end
end

# Folder: 97_dynamically_calling_methods

require "minitest/autorun"
require_relative "main"

class TestSendMethod < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_add
    assert_equal 15, @calculator.send(:add, 10, 5)
  end

  def test_subtract
    assert_equal 5, @calculator.send(:subtract, 10, 5)
  end

  def test_multiply
    assert_equal 50, @calculator.send(:multiply, 10, 5)
  end
end

# Folder: 98_singleton

require "minitest/autorun"
require_relative "main"

class TestAnimalSingleton < Minitest::Test
  def test_only_one_instance
    animal1 = Animal.instance
    animal2 = Animal.instance
    assert_same animal1, animal2, "Should only return a single instance."
  end

  def test_speak
    animal = Animal.instance
    assert_equal "Animal sound", animal.speak
  end

  def test_cannot_create_new_instance_directly
    assert_raises(NoMethodError) { Animal.new }
  end
end

# Folder: 99_dynamically_define_class

require "minitest/autorun"
require_relative "main"

class TestDynamicClassMethod < Minitest::Test
  def test_greet
    output = StringIO.new
    $stdout = output

    User.greet

    $stdout = STDOUT

    expected_output = "Hello from User class!"
    assert_equal expected_output, output.string.strip, "Expected 'Hello from User class!' but got #{output.string.strip}."
  end
end