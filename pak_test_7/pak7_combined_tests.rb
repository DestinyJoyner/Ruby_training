# PART_7_IN_CLASS TESTS

# Folder: 85_begin_rescue_ensure

require "minitest/autorun"
require_relative "pak7_problems.rb"

class TestExceptionHandling < Minitest::Test
  def test_divide_numbers_success
    output = capture_output do
      divide_numbers(10, 2)
    end

    expected_output = "Result: 5\nOperation complete."
    assert_equal expected_output, output.strip, "Output did not match expected result."
  end

  def test_divide_numbers_zero_division
    output = capture_output do
      divide_numbers(10, 0)
    end

    expected_output = "Cannot divide by zero.\nOperation complete."
    assert_equal expected_output, output.strip, "Output did not match expected result."
  end

  private

  def capture_output
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end

# Folder: 86_custom_exception_class

require "minitest/autorun"
require_relative "pak7_problems.rb"

class TestCustomException < Minitest::Test
  def test_valid_age
    output = StringIO.new
    $stdout = output

    check_age(20)

    $stdout = STDOUT

    expected_output = "Access granted."
    assert_equal expected_output, output.string.strip, "Output did not match expected result."
  end

  def test_invalid_age
    assert_raises(InvalidAgeError) { check_age(15) }
  end
end

# # Folder: 87_retry

require "minitest/autorun"
require_relative "pak7_problems.rb"

class TestRetryHandling < Minitest::Test
  def test_fetch_data
    output = StringIO.new
    $stdout = output

    fetch_data

    $stdout = STDOUT

    assert_match(/Data fetched successfully!/, output.string, "Expected at least one successful data fetch.")
  end
end

# # Folder: 88_rescue_else

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestElseHandling < Minitest::Test
#   def test_safe_divide_success
#     output = StringIO.new
#     $stdout = output

#     safe_divide(10, 2)

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Result: 5
#       Division successful.
#       Operation complete.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_safe_divide_zero_division
#     output = StringIO.new
#     $stdout = output

#     safe_divide(10, 0)

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Cannot divide by zero.
#       Operation complete.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end
# end

# # Folder: 89_multiple_error_types

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestMultipleRescueHandling < Minitest::Test
#   def test_valid_number
#     output = StringIO.new
#     $stdout = output

#     parse_number("42")

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Parsed number: 42
#       Parsing complete.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_invalid_number_format
#     output = StringIO.new
#     $stdout = output

#     parse_number("abc")

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Invalid number format.
#       Parsing complete.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_nil_input
#     output = StringIO.new
#     $stdout = output

#     parse_number(nil)

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Cannot convert nil to a number.
#       Parsing complete.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end
# end

# # Folder: 90_nested_rescue

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestNestedRescue < Minitest::Test
#   def test_string_input
#     output = StringIO.new
#     $stdout = output

#     process_data("hello")

#     $stdout = STDOUT

#     expected_output = "Converted: HELLO"
#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_integer_input_with_retry
#     output = StringIO.new
#     $stdout = output

#     process_data(123)

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Invalid data type. Attempting conversion...
#       Converted: 123
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_nil_input_fails
#     output = StringIO.new
#     $stdout = output

#     process_data(nil)

#     $stdout = STDOUT

#     expected_output = <<~OUTPUT
#       Invalid data type. Attempting conversion...
#       Cannot process data.
#     OUTPUT

#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end
# end

# # Folder: 91_handling_exception_rescue

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestFileExceptionHandling < Minitest::Test
#   def test_existing_file
#     output = StringIO.new
#     $stdout = output

#     read_file("existing_file.txt")

#     $stdout = STDOUT

#     expected_output = "File read successfully!"
#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_missing_file
#     output = StringIO.new
#     $stdout = output

#     read_file("missing.txt")

#     $stdout = STDOUT

#     expected_output = "File not found."
#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_protected_file
#     output = StringIO.new
#     $stdout = output

#     read_file("protected.txt")

#     $stdout = STDOUT

#     expected_output = "Access denied."
#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end
# end

# # Folder: 92_rescue_all_errors

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestGenericRescue < Minitest::Test
#   def test_process_data
#     output = StringIO.new
#     $stdout = output

#     3.times { process_data(10) }

#     $stdout = STDOUT

#     assert_match(/Handled ZeroDivisionError|Handled ArgumentError|Handled unknown error/, output.string, "Unexpected output in error handling.")
#   end

#   def test_error_logging
#     assert File.exist?("error.log"), "Expected 'error.log' to be created."
#     log_content = File.read("error.log")
#     assert_match(/Division by zero occurred|Invalid argument given|Some unexpected issue occurred/, log_content, "Expected error messages in log file.")
#   end
# end

# # Folder: 93_rasising_custom_exception

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestCustomException < Minitest::Test
#   def test_valid_age
#     output = StringIO.new
#     $stdout = output

#     validate_age(20)

#     $stdout = STDOUT

#     expected_output = "Age is valid."
#     assert_equal expected_output.strip, output.string.strip, "Output did not match expected result."
#   end

#   def test_invalid_age
#     assert_raises(InvalidInputError) { validate_age(16) }
#   end
# end

# # Folder: 94_retrying

# require "minitest/autorun"
# require_relative "pak7_problems.rb"

# class TestRetryBackoff < Minitest::Test
#   def setup
#     File.delete("error.log") if File.exist?("error.log")
#   end

#   def test_fetch_data
#     output = StringIO.new
#     $stdout = output

#     fetch_data

#     $stdout = STDOUT

#     assert_match(/Fetching data.../, output.string, "Expected fetching data message.")
#   end

#   def test_error_logging
#      fetch_data #Call the function
#      sleep 0.1 # Short delay to let logger write (Avoid Race Condition)
#     assert File.exist?("error.log"), "Expected 'error.log' to be created."
#     log_content = File.read("error.log")
#     assert_match(/Temporary failure/, log_content, "Expected temporary failure message in log file.")
#   end
# end