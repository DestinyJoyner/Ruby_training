require "minitest/autorun"
require_relative "main"  # Ensure main.rb is loaded

class TestYieldWithParameter < Minitest::Test
  def test_yield_with_parameter
    yield_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track `yield` calls and capture output
    test_proc = Proc.new do |name|
      yield_count += 1
      puts "Hello, #{name}!"
    end

    # Call the method with the spy Proc
    greet_person(&test_proc)

    $stdout = STDOUT

    expected_output = "Hello, Alice!\n"

    # Assertions
    assert_equal 1, yield_count, "Expected `yield` to be called once, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
