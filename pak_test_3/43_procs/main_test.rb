require "minitest/autorun"
require_relative "main" 

class TestBasicProc < Minitest::Test
  def test_proc_call
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

 
    spy_proc = Proc.new do
      proc_call_count += 1
      puts "Hello from Proc!"
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
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
