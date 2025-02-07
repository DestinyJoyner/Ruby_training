require "minitest/autorun"
require_relative "main"  

class TestProcMultipleArguments < Minitest::Test
  def test_proc_with_default_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

   
    spy_proc = Proc.new do |a = 0, b = 0|
      proc_call_count += 1
      puts a + b
    end


    add = spy_proc
    add.call(4, 6)
    add.call(5)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      10
      5
    OUTPUT


    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
