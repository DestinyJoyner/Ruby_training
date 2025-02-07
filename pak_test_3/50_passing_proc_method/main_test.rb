require "minitest/autorun"
require_relative "main"  # Ensure main.rb is loaded

class TestPassingProc < Minitest::Test
  def test_passing_proc_to_method
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

    # Spy Proc to track calls and capture output
    spy_proc = Proc.new do
      proc_call_count += 1
      puts "Hello from Proc!"
    end

    # Call the method with the spy Proc
    execute_proc(spy_proc)

    $stdout = STDOUT

    expected_output = "Hello from Proc!\n"

    # Assertions
    assert_equal 1, proc_call_count, "Expected Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
