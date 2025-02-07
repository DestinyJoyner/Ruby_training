require "minitest/autorun"
require_relative "main"  

class TestProcArguments < Minitest::Test
  def test_proc_with_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output


    spy_proc = Proc.new do |name|
      proc_call_count += 1
      puts "Hello, #{name}!"
    end


    greet = spy_proc
    greet.call("Alice")
    greet.call("Bob")

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Alice!
      Hello, Bob!
    OUTPUT


    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
