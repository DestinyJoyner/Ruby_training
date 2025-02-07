require "minitest/autorun"
require_relative "main"  # Ensure main.rb is loaded

class TestCustomIterator < Minitest::Test
  def test_custom_iterator
    yield_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track `yield` calls
    test_proc = Proc.new do
      yield_count += 1
      puts "Executing block!"
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
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
