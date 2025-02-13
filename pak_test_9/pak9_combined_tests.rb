# PART_9_IN_CLASS TESTS

# Folder: 102_creating_reading_file

require "minitest/autorun"
require_relative "main"

class TestFileRead < Minitest::Test
  def test_file_read
    content = File.read("example.txt")
    
    expected_output = <<~OUTPUT
      Hello, this is a test file.
      Learning Ruby File Handling!
    OUTPUT

    assert_equal expected_output.strip, content.strip, "File content did not match expected output."
  end
end

# Folder: 103_appending_file

require "minitest/autorun"
require_relative "main"

class TestFileAppend < Minitest::Test
  def test_file_append
    content = File.read("output.txt")

    expected_output = <<~OUTPUT
      This is new content.
      Appended line.
    OUTPUT

    assert_equal expected_output.strip, content.strip, "File content did not match expected output after appending."
  end
end

# Folder: 104_file_existence

require "minitest/autorun"
require_relative "main"

class TestFileExistence < Minitest::Test
  def test_file_existence
    output = StringIO.new
    $stdout = output

    filename = "non_existent.txt"
    File.exist?(filename) ? puts("File exists!") : puts("File not found.")

    $stdout = STDOUT

    expected_output = "File not found."
    assert_equal expected_output, output.string.strip, "File existence check did not match expected output."
  end
end

# Folder: 105_file_permission

require "minitest/autorun"
require_relative "main"

class TestFilePermissions < Minitest::Test
  def test_file_writable
    output = StringIO.new
    $stdout = output

    filename = "example.txt"
    File.writable?(filename) ? puts("File is writable.") : puts("File is not writable.")

    $stdout = STDOUT

    expected_output = "File is writable."
    assert_equal expected_output, output.string.strip, "File writable check did not match expected output."
  end
end

# Folder: 106_writing_to_csv

require "minitest/autorun"
require "csv"
require_relative "main"

class TestCSVFileHandling < Minitest::Test
  def test_csv_read
    data = CSV.read("data.csv")
    expected_output = [["Name", "Age", "City"], ["Alice", "30", "New York"], ["Bob", "25", "Los Angeles"]]
    assert_equal expected_output, data, "CSV file content did not match expected output."
  end
end

# Folder: 107_parsing_json

require "minitest/autorun"
require "json"
require_relative "main"

class TestJSONFileHandling < Minitest::Test
  def test_json_read
    parsed_data = JSON.parse(File.read("data.json"))
    assert_equal "Alice", parsed_data["name"], "JSON data did not match expected output."
  end
end

# Folder: 108_creating_YAML

require "minitest/autorun"
require "yaml"
require_relative "main"

class TestYAMLFileHandling < Minitest::Test
  def test_yaml_read
    config = YAML.load(File.read("config.yml"))
    assert_equal "MyRubyApp", config["app_name"], "YAML data did not match expected output."
  end
end

# Folder: 109_creating_managing_threads

require "minitest/autorun"
require_relative "main"

class TestThreads < Minitest::Test
  def test_threads_execution
    output = StringIO.new
    $stdout = output

    t1 = Thread.new { puts "Thread 1 is running" }
    t2 = Thread.new { puts "Thread 2 is running" }

    t1.join
    t2.join

    $stdout = STDOUT

    assert_match(/Thread 1 is running/, output.string, "Expected output to include 'Thread 1 is running'.")
    assert_match(/Thread 2 is running/, output.string, "Expected output to include 'Thread 2 is running'.")
  end
end

# Folder: 110_thread_sync_mutex

require "minitest/autorun"
require_relative "main"

class TestThreadSafety < Minitest::Test
  def test_thread_safe_counter
    output = StringIO.new
    $stdout = output

    final_count = thread_safe_counter
    puts "Final count: #{final_count}"

    $stdout = STDOUT

    assert_match(/Final count: 10000/, output.string.strip, "Expected final count to be 10000, but got: #{output.string.strip}")
  end
end

# Folder: 111_using_queue_thread_safe_operation

require "minitest/autorun"
require_relative "main"

class TestQueueProcessing < Minitest::Test
  def test_queue_processing
    expected_numbers = (1..10).map { |n| "Processing: #{n}" }.to_set

    # Capture the processed numbers from the function return
    actual_numbers = process_queue.to_set

    assert_equal expected_numbers, actual_numbers, "Queue did not process all numbers correctly."
  end
end

# Folder: 112_thread_value

require "minitest/autorun"
require_relative "main"

class TestThreadValue < Minitest::Test
  def test_thread_return_value
    result = compute_square
    assert_equal 25, result, "Expected thread return value to be 25, but got #{result}."
  end
end

# Folder: 113_Fiber

require "minitest/autorun"
require_relative "main"

class TestFiber < Minitest::Test
  def test_fiber_execution
    expected_output = ["First step", "Second step"]
    actual_output = fiber_execution

    assert_equal expected_output, actual_output, "Expected fiber execution output to match but got #{actual_output}."
  end
end