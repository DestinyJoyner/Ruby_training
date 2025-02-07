require "minitest/autorun"
require_relative "main" 

class TestMultipleProcs < Minitest::Test
  def test_multiple_procs
    proc1_call_count = 0
    proc2_call_count = 0
    output = StringIO.new
    $stdout = output

  
    spy_proc1 = Proc.new do |x|
      proc1_call_count += 1
      x * 2  
    end

    spy_proc2 = Proc.new do |x|
      proc2_call_count += 1
      x + 10 
    end


    process_numbers(spy_proc1, spy_proc2, 20)

    $stdout = STDOUT

    expected_output = "50\n"


    assert_equal 1, proc1_call_count, "Expected first Proc to be called once, but it wasn't."
    assert_equal 1, proc2_call_count, "Expected second Proc to be called once, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
