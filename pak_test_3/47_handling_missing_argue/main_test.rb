require "minitest/autorun"
require_relative "main"  # Ensure main.rb is loaded

class TestProcMissingArguments < Minitest::Test
  def test_proc_with_missing_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track calls
    spy_proc = Proc.new do |name = "Guest"|
      proc_call_count += 1
      puts "Hello, #{name}!"
    end

    # Replace original Proc with the spy Proc
    greet = spy_proc
    greet.call("Alice")
    greet.call

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Alice!
      Hello, Guest!
    OUTPUT

    # Assertions
    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
