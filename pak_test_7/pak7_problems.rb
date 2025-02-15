# PART_7_IN_CLASS PROBLEMS

# Problem: 85_begin_rescue_ensure

# Instructions:
# Write a Ruby script that:
#
# Defines a method divide_numbers(a, b) that:
# Attempts to divide a / b.
# Catches division by zero using rescue ZeroDivisionError and prints "Cannot divide by zero.".
# Prints "Operation complete." in ensure, regardless of success or failure.
# Calls divide_numbers(10, 2) (should work).
# Calls divide_numbers(10, 0) (should trigger the error handler).
#
# Output:
# Result: 5
# Operation complete.
# Cannot divide by zero.
# Operation complete.

# Your solution for 85_begin_rescue_ensure goes here:
def divide_numbers(a, b)
  a / b
  puts "Result: #{a / b}"
rescue ZeroDivisionError => e
  puts 'Cannot divide by zero.'
ensure
  puts 'Operation complete.'
end

# Problem: 86_custom_exception_class

# Instructions:
# Write a Ruby script that:
#
# Defines a custom exception class InvalidAgeError < StandardError.
# Defines a method check_age(age) that:
# Raises InvalidAgeError if age < 18, with message "Age must be 18 or older.".
# Prints "Access granted." if the age is valid.
# Calls check_age(20) (should work).
# Calls check_age(15) (should raise InvalidAgeError).
#
# Output:
# Access granted.
# (main.rb):... Age must be 18 or older. (InvalidAgeError)

# Your solution for 86_custom_exception_class goes here:
class InvalidAgeError < StandardError
end

def check_age(age)
  puts 'Access granted.' if age >= 18
  raise InvalidAgeError, 'Age must be 18 or older.'
end
# Problem: 87_retry

# Instructions:
# Write a Ruby script that:
#
# Defines a method fetch_data(attempts = 0) that:
# Simulates a random failure (rand(2).zero?).
# If it fails, raises RuntimeError, printing "Fetching data failed.".
# Retries once before failing permanently.
# Calls fetch_data.
#
# Output:
# Fetching data failed.
# Retrying...
# Data fetched successfully!

# Your solution for 87_retry goes here:
# def fetch_data(attempts = 0)
#   begin
#     unless rand(2).zero? and attempts > 0
#       raise RuntimeError, "Fetching data failed."
#       puts "Retrying..."
#       fetch_data(attempts -= 1)
#     else
#       puts "Data fetched successfully!"
#     end
#   end
# end
def fetch_data(attempts = 0)
  # Simulate random failure (50% chance)
  raise 'Fetching data failed.' if rand(2).zero?

  puts 'Data fetched successfully!'
rescue RuntimeError => e
  # Print the error message
  puts e.message

  # If we haven't retried yet (attempts is 0)
  raise unless attempts == 0

  puts 'Retrying...'
  # Retry with attempts incremented
  fetch_data(attempts + 1)

  # If we've already retried once, re-raise the error
end

# Problem: 88_rescue_else

# Instructions:
# Write a Ruby script that:
#
# Defines a method safe_divide(a, b) that:
# Tries to divide a / b.
# Handles division by zero with rescue.
# Uses else to print "Division successful." if no error occurs.
# Always prints "Operation complete." in ensure.
# Calls safe_divide(10, 2).
# Calls safe_divide(10, 0).
#
# Output:
# Result: 5
# Division successful.
# Operation complete.
# Cannot divide by zero.
# Operation complete.

# Your solution for 88_rescue_else goes here:
def safe_divide(a, b)
  a / b
  puts "Result: #{a / b}"
  puts 'Division successful.'
rescue ZeroDivisionError => e
  puts 'Cannot divide by zero.'
ensure
  puts 'Operation complete.'
end

# Problem: 89_multiple_error_types

# Instructions:
# Write a Ruby script that:
#
# Defines a method parse_number(input) that:
# Attempts to convert input to an integer.
# Handles ArgumentError if input is not a number, printing "Invalid number format.".
# Handles TypeError if input is nil, printing "Cannot convert nil to a number.".
# Prints "Parsing complete." in ensure.
# Calls parse_number("42"), parse_number("abc"), and parse_number(nil).
#
# Output:
# Parsed number: 42
# Parsing complete.
# Invalid number format.
# Parsing complete.
# Cannot convert nil to a number.
# Parsing complete.

# Your solution for 89_multiple_error_types goes here:
def parse_number(input)
  input.to_int
rescue ArgumentError => e
  puts 'Invalid number format.'
rescue TypeError => e
  puts 'Cannot convert nil to a number.'
ensure
  puts 'Parsing Complete.'
end

# Problem: 90_nested_rescue

# Instructions:
# Write a Ruby script that:
#
# Defines a method process_data(data) that:
# Tries to convert data to uppercase (data.upcase!).
# Uses a nested begin-rescue to retry once if data is an integer.
# Handles NoMethodError if data is an integer or nil, printing "Invalid data type. Attempting conversion..." before retrying.
# Handles TypeError if the conversion attempt fails.
# Calls process_data("hello"), process_data(123), and process_data(nil).
#
# Output:
# Converted: HELLO
# Invalid data type. Attempting conversion...
# Converted: 123
# Invalid data type. Attempting conversion...
# Cannot process data.

# Your solution for 90_nested_rescue goes here:
def process_data(data)
  # Outer begin

  # Nested begin
  begin
    # attempt to upcase
    data.upcase!
    puts "Converted: #{data}"
  # nested rescue
  rescue NoMethodError
    # Handle the first failure
    puts 'Invalid data type. Attempting conversion...'
    # Try to convert the data
    raise NoMethodError if data.nil?

    # If nil raise

    # For integers, convert to string and retry
    data = data.to_s
    # Retry inner begin block
    retry
  end
# Outer rescue
rescue NoMethodError
  # Handle final failure
  puts 'Cannot process data.'
end

# Problem: 91_handling_exception_rescue

# Instructions:
# Write a Ruby script that:
#
# Defines a method read_file(filename) that:
# Tries to read filename using File.read.
# Handles Errno::ENOENT (File Not Found) and prints "File not found.".
# Handles Errno::EACCES (Permission Denied) and prints "Access denied.".
# Calls read_file("existing_file.txt"), read_file("missing.txt"), and read_file("protected.txt").
#
# Output:
# File read successfully!
# File not found.
# Access denied.

# Your solution for 91_handling_exception_rescue goes here:
# put restrictions on protected file : ruby -e 'File.chmod(0000, "protected.txt")'
def read_file(filename)
  File.read(filename)
  puts 'File read successfully!'
rescue Errno::ENOENT => e
  puts 'File not found.'
rescue Errno::EACCES => e
  puts 'Access denied.'
end

# Problem: 92_rescue_all_errors

# Instructions:
# Write a Ruby script that:
#
# Defines a method process_data(input) that:
# Raises an error randomly (ZeroDivisionError or ArgumentError).
# Rescues specific errors with custom messages.
# Catches all other errors with a generic rescue StandardError.
# Logs errors to a file (error.log).
# Calls process_data(10) multiple times.
#
# Output:
# Handled ZeroDivisionError: Cannot divide by zero.
# Handled ArgumentError: Invalid argument provided.
# Handled unknown error: Some unexpected issue occurred.

# Your solution for 92_rescue_all_errors goes here:
def process_data_2(input)
  # Randomly select a number 0, 1, or 2
  case rand(3)
  when 0
    raise ZeroDivisionError, 'Division by zero occurred'
  when 1
    raise ArgumentError, 'Invalid argument given'
  else
    raise StandardError, 'Some unexpected issue occurred'
  end
rescue ZeroDivisionError => e
  puts 'Handled ZeroDivisionError'
  File.write('error.log', e.message)
rescue ArgumentError => e
  puts 'Handled ArgumentError'
  File.write('error.log', e.message)
rescue StandardError => e
  puts 'Handled unknown error'
  File.write('error.log', e.message)
end

# Problem: 93_rasising_custom_exception

# Instructions:
# Write a Ruby script that:
#
# Defines a custom exception class InvalidInputError < StandardError that:
# Takes an additional details argument.
# Overrides message to return a formatted string with details.
# Defines a method validate_age(age) that:
# Raises InvalidInputError if age < 18 with details: "Minimum age is 18.".
# Calls validate_age(20) and validate_age(16).
#
# Output:
# Age is valid.
# InvalidInputError: Invalid input - Minimum age is 18.

# Your solution for 93_rasising_custom_exception goes here:
class InvalidInputError < StandardError
# Takes details in initialize
# Stores details in instance variable
# message method formats the error message
  def initialize(details)
    @details = details
  end

  def message
    "Invalid input - #{@details}"
  end
end

def validate_age_2(age)
  if age >= 18
    puts "Age is valid."
  else
    raise InvalidInputError.new("Minimum age is 18.")
  end
end

# Problem: 94_retrying

# Instructions:
# Write a Ruby script that:
#
# Defines a method fetch_data(retries = 0) that:
# Randomly fails (raise RuntimeError, "Temporary failure") 50% of the time.
# Retries with exponential backoff (sleep(2\*\*retries)) up to 3 times.
# Logs errors to error.log.
# Calls fetch_data.
#
# Output:
# Fetching data...
# Fetching failed, retrying in 1 seconds...
# Fetching failed, retrying in 2 seconds...
# Fetching failed, retrying in 4 seconds...
# Operation failed permanently.

# Your solution for 94_retrying goes here:
def fetch_data_2(retries = 0)
  if retries < 3
    if rand(2) == 0
      raise RuntimeError, "Temporary failure"
    else
      puts "Fetching data..."
      return "Data fetched successfully"
    end
  else
    puts "Operation failed permanently."
  end
end
