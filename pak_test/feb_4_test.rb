# Folder: 10_case

require 'minitest/autorun'

class TestCaseStatement < Minitest::Test
  def test_case_statement
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = "Good\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 11_while

require 'minitest/autorun'

class TestWhileUntilLoops < Minitest::Test
  def test_while_until_loops
    output = StringIO.new
    $stdout = output

    load 'combined_ main.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      2
      3
      4
      5
      6
      7
      8
      9
      10
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 12_for_loop

require 'minitest/autorun'

class TestForLoop < Minitest::Test
  def test_for_loop
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Iteration: 1
      Iteration: 2
      Iteration: 3
      Iteration: 4
      Iteration: 5
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 13_each_time_upto_downto

require 'minitest/autorun'

class TestEachTimesUptoDownto < Minitest::Test
  def test_iteration_methods
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Each: 1
      Each: 2
      Each: 3
      Hello
      Hello
      Hello
      Upto: 1
      Upto: 2
      Upto: 3
      Downto: 3
      Downto: 2
      Downto: 1
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 14_break

require 'minitest/autorun'

class TestBreakKeyword < Minitest::Test
  def test_break_keyword
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      2#{' '}
      3
      4
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 15_next

require 'minitest/autorun'

class TestNextKeyword < Minitest::Test
  def test_next_keyword
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      2
      4
      5
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 16_redo

require 'minitest/autorun'

class TestRedoKeyword < Minitest::Test
  def test_redo_keyword
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      2
      Redoing 3
      3
      4
      5
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 17_retry

require 'minitest/autorun'

class TestRetryKeyword < Minitest::Test
  def test_retry_keyword
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Retrying with num = 2
      Result: 5
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 1_puts

require 'minitest/autorun'

class TestHelloRuby < Minitest::Test
  def test_hello_ruby
    expected_output = "Hello, Ruby!\n"
    assert_output(expected_output) { load 'feb_4_exercise.rb' }
  end
end

# Folder: 2_user_input

require 'minitest/autorun'
require 'stringio'

class TestUserInput < Minitest::Test
  def test_user_input
    input = StringIO.new("Alice\n")
    output = StringIO.new

    $stdin = input
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdin = STDIN
    $stdout = STDOUT

    expected_output = "Enter your name:\nHello, Alice!\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 3_variables

require 'minitest/autorun'

class TestVariableAssignment < Minitest::Test
  def test_variable_assignment
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb' # Changed from "main.rb" to "combined_main.rb"

    $stdout = STDOUT # Restore original output

    expected_output = <<~OUTPUT
      Integer: 42
      Float: 3.14
      String: Hello, world!
      Boolean (true): true
      Boolean (false): false
      Symbol: ruby
      Array: [1, 2, 3]
      Hash: {:name=>"Alice", :age=>25}
      Nil:#{' '}
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 4_constant

require 'minitest/autorun'

class TestConstants < Minitest::Test
  def test_constant
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb' # Run the user's script

    $stdout = STDOUT # Restore original output

    expected_output = "The value of PI is 3.14159\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 5_arithmetic_operators_string_interpolation

require 'minitest/autorun'

class TestArithmeticOperators < Minitest::Test
  def test_arithmetic_operations
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Addition: 5 + 3 = 8
      Subtraction: 5 - 3 = 2
      Multiplication: 5 * 3 = 15
      Division: 5 / 3 = 1
      Modulus: 5 % 3 = 2
      Exponentiation: 5 ** 3 = 125
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 6_comparison_operators

require 'minitest/autorun'

class TestComparisonOperators < Minitest::Test
  def test_comparison_operations
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      7 == 4: false
      7 != 4: true
      7 > 4: true
      7 < 4: false
      7 >= 4: true
      7 <= 4: false
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 7_logical_operators

require 'minitest/autorun'

class TestLogicalOperators < Minitest::Test
  def test_logical_operations
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      true && false: false
      true || false: true
      !true: false
      !(false || true): false
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 8_ternary_operator

require 'minitest/autorun'

class TestTernaryOperator < Minitest::Test
  def test_ternary_operator
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = "10 is even\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 9_if_else

require 'minitest/autorun'

class TestIfElsifElse < Minitest::Test
  def test_if_elsif_else
    output = StringIO.new
    $stdout = output

    load 'feb_4_exercise.rb'

    $stdout = STDOUT

    expected_output = "15 is greater than 10\n"
    assert_equal expected_output, output.string
  end
end
