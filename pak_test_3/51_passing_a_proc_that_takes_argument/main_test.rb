require "minitest/autorun"
require_relative "main"  

class TestProcWithArguments < Minitest::Test
  def test_proc_with_argument
    proc_call_count = 0
    output = StringIO.new
    $stdout = output


    spy_proc = Proc.new do |x|
      proc_call_count += 1
      x**2  
    end

    
    execute_with_argument(spy_proc, 5)

    $stdout = STDOUT

    expected_output = "25\n"


    assert_equal 1, proc_call_count, "Expected Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
