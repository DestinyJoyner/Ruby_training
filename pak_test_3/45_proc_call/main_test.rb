require "minitest/autorun"
require_relative "main"  

class TestProcCallSyntax < Minitest::Test
  def test_proc_call_methods
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

   
    spy_proc = Proc.new do |num|
      proc_call_count += 1
      num * 2
    end

 
    double = spy_proc
    puts double.call(5)
    puts double[5]

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      10
      10
    OUTPUT


    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
