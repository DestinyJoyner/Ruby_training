# PAK_TEST_3 TESTS

# Folder: 36_blocks
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

class TestEachBlock < Minitest::Test
  def test_each_block
    output = StringIO.new
    $stdout = output

    load 'pak3_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      2
      4
      6
      8
      10
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 37_do_end

require 'minitest/autorun'

class TestBlockSyntax < Minitest::Test
  def test_block_syntax
    output = StringIO.new
    $stdout = output

    load 'pak3_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Value: 10
      Value: 20
      Value: 30
      Value: 10
      Value: 20
      Value: 30
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 38_yield

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestYieldBlock < Minitest::Test
  def test_yield_block
    yield_count = 0
    output = StringIO.new
    $stdout = output

    test_proc = proc do
      yield_count += 1
      puts 'Hello!'
    end

    repeat_twice(&test_proc)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello!
      Hello!
    OUTPUT

    # Assertions
    assert_equal 2, yield_count, "Expected `yield` to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 39_yield_parameters

require 'minitest/autorun'
require_relative 'pak3_problems' # Ensure pak3_problems.rb is loaded

class TestYieldWithParameter < Minitest::Test
  def test_yield_with_parameter
    yield_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track `yield` calls and capture output
    test_proc = proc do |name|
      yield_count += 1
      puts "Hello, #{name}!"
    end

    # Call the method with the spy Proc
    greet_person(&test_proc)

    $stdout = STDOUT

    expected_output = "Hello, Alice!\n"

    # Assertions
    assert_equal 1, yield_count, "Expected `yield` to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 40_block_map

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestMapBlock < Minitest::Test
  def test_map_block
    output = StringIO.new
    $stdout = output

    map_called = false

    Array.class_eval do
      alias_method :original_map, :map

      define_method(:map) do |&block|
        map_called = true
        original_map(&block)
      end
    end

    load 'pak3_problems.rb'

    $stdout = STDOUT

    expected_output = "[2, 4, 6, 8]\n"

    Array.class_eval do
      alias_method :map, :original_map
      remove_method :original_map
    end

    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 41_block_yield

require 'minitest/autorun'
require_relative 'pak3_problems' # Ensure pak3_problems.rb is loaded

class TestYieldWithNoBlock < Minitest::Test
  def test_yield_with_no_block
    yield_count = 0
    output = StringIO.new
    $stdout = output

    test_proc = proc do
      yield_count += 1
      puts 'Hello, Ruby!'
    end

    greet(&test_proc)
    greet

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Ruby!
      No block given.
    OUTPUT

    assert_equal 1, yield_count, "Expected `yield` to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 42_customer_iterator

require 'minitest/autorun'
require_relative 'pak3_problems' # Ensure pak3_problems.rb is loaded

class TestCustomIterator < Minitest::Test
  def test_custom_iterator
    yield_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track `yield` calls
    test_proc = proc do
      yield_count += 1
      puts 'Executing block!'
    end

    # Call the method with the spy Proc
    repeat_three_times(&test_proc)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Executing block!
      Executing block!
      Executing block!
    OUTPUT

    # Assertions
    assert_equal 3, yield_count, "Expected `yield` to be called three times, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 43_procs

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestBasicProc < Minitest::Test
  def test_proc_call
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do
      proc_call_count += 1
      puts 'Hello from Proc!'
    end

    greet = spy_proc
    greet.call
    greet.call

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello from Proc!
      Hello from Proc!
    OUTPUT

    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 44_procs_arguments

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcArguments < Minitest::Test
  def test_proc_with_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |name|
      proc_call_count += 1
      puts "Hello, #{name}!"
    end

    greet = spy_proc
    greet.call('Alice')
    greet.call('Bob')

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Alice!
      Hello, Bob!
    OUTPUT

    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 45_proc_call

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcCallSyntax < Minitest::Test
  def test_proc_call_methods
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |num|
      proc_call_count += 1
      num * 2
    end

    double = spy_proc
    puts double.call(5)
    puts double[5]

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      10
      10
    OUTPUT

    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 46_proc_array

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcWithMap < Minitest::Test
  def test_proc_with_map
    proc_call_count = 0
    map_called = false
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |num|
      proc_call_count += 1
      num**2
    end

    numbers = [1, 2, 3, 4]
    numbers.define_singleton_method(:map) do |&block|
      map_called = true
      super(&block)
    end

    square = spy_proc
    squared_numbers = numbers.map(&square)
    puts squared_numbers.inspect

    $stdout = STDOUT

    expected_output = "[1, 4, 9, 16]\n"

    assert_equal 4, proc_call_count, "Expected Proc to be called 4 times, but it wasn't."
    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 47_handling_missing_argue

require 'minitest/autorun'
require_relative 'pak3_problems' # Ensure pak3_problems.rb is loaded

class TestProcMissingArguments < Minitest::Test
  def test_proc_with_missing_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track calls
    spy_proc = proc do |name = 'Guest'|
      proc_call_count += 1
      puts "Hello, #{name}!"
    end

    # Replace original Proc with the spy Proc
    greet = spy_proc
    greet.call('Alice')
    greet.call

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Alice!
      Hello, Guest!
    OUTPUT

    # Assertions
    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 48_multiple_arguments

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcMultipleArguments < Minitest::Test
  def test_proc_with_default_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |a = 0, b = 0|
      proc_call_count += 1
      puts a + b
    end

    add = spy_proc
    add.call(4, 6)
    add.call(5)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      10
      5
    OUTPUT

    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 49_handling_too_many_arguments

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcExtraArguments < Minitest::Test
  def test_proc_with_extra_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |a, b, *extra|
      proc_call_count += 1
      puts "Product: #{a * b}"
      puts "Extra arguments: #{extra.inspect}" unless extra.empty?
    end

    multiply = spy_proc
    multiply.call(3, 4)
    multiply.call(2, 3, 5, 7)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Product: 12
      Product: 6
      Extra arguments: [5, 7]
    OUTPUT

    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 50_passing_proc_method

require 'minitest/autorun'
require_relative 'pak3_problems' # Ensure pak3_problems.rb is loaded

class TestPassingProc < Minitest::Test
  def test_passing_proc_to_method
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track calls and capture output
    spy_proc = proc do
      proc_call_count += 1
      puts 'Hello from Proc!'
    end

    # Call the method with the spy Proc
    execute_proc(spy_proc)

    $stdout = STDOUT

    expected_output = "Hello from Proc!\n"

    # Assertions
    assert_equal 1, proc_call_count, "Expected Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 51_passing_a_proc_that_takes_argument

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcWithArguments < Minitest::Test
  def test_proc_with_argument
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |x|
      proc_call_count += 1
      x**2
    end

    execute_with_argument(spy_proc, 5)

    $stdout = STDOUT

    expected_output = "25\n"

    assert_equal 1, proc_call_count, "Expected Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 52_passing_multiple_procs_method

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestMultipleProcs < Minitest::Test
  def test_multiple_procs
    proc1_call_count = 0
    proc2_call_count = 0
    output = StringIO.new
    $stdout = output

    spy_proc1 = proc do |x|
      proc1_call_count += 1
      x * 2
    end

    spy_proc2 = proc do |x|
      proc2_call_count += 1
      x + 10
    end

    process_numbers(spy_proc1, spy_proc2, 20)

    $stdout = STDOUT

    expected_output = "50\n"

    assert_equal 1, proc1_call_count, "Expected first Proc to be called once, but it wasn't."
    assert_equal 1, proc2_call_count, "Expected second Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 53_proc_array

require 'minitest/autorun'
require_relative 'pak3_problems'

class TestProcWithMap < Minitest::Test
  def test_proc_with_map
    proc_call_count = 0
    map_called = false
    output = StringIO.new
    $stdout = output

    spy_proc = proc do |x|
      proc_call_count += 1
      x * 2
    end

    array = [1, 2, 3, 4, 5]
    array.define_singleton_method(:map) do |&block|
      map_called = true
      super(&block)
    end

    apply_proc_to_array(array, spy_proc)

    $stdout = STDOUT

    expected_output = "[2, 4, 6, 8, 10]\n"

    assert_equal 5, proc_call_count, "Expected Proc to be called 5 times, but it wasn't."
    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end
