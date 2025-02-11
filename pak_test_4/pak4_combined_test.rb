# PART_4_IN_CLASS

# Folder: 55_lambda

require 'minitest/autorun'
require_relative 'main'

class TestBasicLambda < Minitest::Test
  def test_lambda_call
    lambda_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_lambda = lambda do
      lambda_call_count += 1
      puts 'Hello from Lambda!'
    end

    greet = spy_lambda
    greet.call
    greet.call

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello from Lambda!
      Hello from Lambda!
    OUTPUT

    assert_equal 2, lambda_call_count, "Expected Lambda to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 56_lambda_passing_multiple_lambdas

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestMultipleLambdas < Minitest::Test
  def test_multiple_lambdas
    lambda1_call_count = 0
    lambda2_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_lambda1 = lambda do |x|
      lambda1_call_count += 1
      x * 2
    end

    spy_lambda2 = lambda do |x|
      lambda2_call_count += 1
      x + 10
    end

    process_numbers(spy_lambda1, spy_lambda2, 20)

    $stdout = STDOUT

    expected_output = "50\n"

    assert_equal 1, lambda1_call_count, "Expected first Lambda to be called once, but it wasn't."
    assert_equal 1, lambda2_call_count, "Expected second Lambda to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 57_lambda_map

require 'minitest/autorun'
require_relative 'main'

class TestLambdaWithMap < Minitest::Test
  def test_lambda_with_map
    lambda_call_count = 0
    map_called = false
    output = StringIO.new
    $stdout = output

    spy_lambda = lambda do |x|
      lambda_call_count += 1
      x * 2
    end

    numbers = [1, 2, 3, 4, 5]
    numbers.define_singleton_method(:map) do |&block|
      map_called = true
      super(&block)
    end

    apply_lambda_to_array(numbers, spy_lambda)

    $stdout = STDOUT

    expected_output = "[2, 4, 6, 8, 10]\n"

    assert_equal 5, lambda_call_count, "Expected Lambda to be called 5 times, but it wasn't."
    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 58_storing_multiple_lambdas_in_a_hash

require 'minitest/autorun'
require_relative 'main'

class TestLambdaHash < Minitest::Test
  def test_lambda_hash
    lambda_call_count = Hash.new(0)
    output = StringIO.new
    $stdout = output

    spy_operations = {
      double: lambda { |x|
        lambda_call_count[:double] += 1
        x * 2
      },
      square: lambda { |x|
        lambda_call_count[:square] += 1
        x**2
      },
      negate: lambda { |x|
        lambda_call_count[:negate] += 1
        -x
      }
    }

    operations = spy_operations
    puts operations[:double].call(4)
    puts operations[:square].call(4)
    puts operations[:negate].call(4)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      8
      16
      -4
    OUTPUT

    assert_equal 1, lambda_call_count[:double], 'Expected `double` Lambda to be called once.'
    assert_equal 1, lambda_call_count[:square], 'Expected `square` Lambda to be called once.'
    assert_equal 1, lambda_call_count[:negate], 'Expected `negate` Lambda to be called once.'
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 59_passing_a_lambda_that_returns_another_lambda

require 'minitest/autorun'
require_relative 'main'

class TestLambdaReturningLambda < Minitest::Test
  def test_lambda_returning_lambda
    lambda_call_count = Hash.new(0)
    output = StringIO.new
    $stdout = output

    spy_select_lambda = lambda do |operation|
      case operation
      when :add
        lambda { |a, b|
          lambda_call_count[:add] += 1
          a + b
        }
      when :multiply
        lambda { |a, b|
          lambda_call_count[:multiply] += 1
          a * b
        }
      else
        ->(_, _) { 'Invalid operation' }
      end
    end

    add_lambda = spy_select_lambda.call(:add)
    multiply_lambda = spy_select_lambda.call(:multiply)

    puts add_lambda.call(3, 5)
    puts multiply_lambda.call(3, 5)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      8
      15
    OUTPUT

    assert_equal 1, lambda_call_count[:add], 'Expected `add` Lambda to be called once.'
    assert_equal 1, lambda_call_count[:multiply], 'Expected `multiply` Lambda to be called once.'
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 60_using_lambdas_inside_an_enumerator

require 'minitest/autorun'
require_relative 'main'

class TestLambdaWithEnumerator < Minitest::Test
  def test_lambda_with_enumerator
    lambda_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_lambda = lambda do |x|
      lambda_call_count += 1
      x + 1
    end

    increment = spy_lambda

    sequence = Enumerator.new do |yielder|
      num = 1
      5.times do |i|
        yielder << num
        num = increment.call(num) unless i == 4
      end
    end

    puts sequence.to_a.inspect

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 4, 5]\n"

    assert_equal 4, lambda_call_count, 'Expected `increment` Lambda to be called 4 times.'
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end
