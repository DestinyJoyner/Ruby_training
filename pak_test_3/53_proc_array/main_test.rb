require "minitest/autorun"
require_relative "main"  

class TestProcWithMap < Minitest::Test
  def test_proc_with_map
    proc_call_count = 0
    map_called = false
    output = StringIO.new
    $stdout = output

  
    spy_proc = Proc.new do |x|
      proc_call_count += 1
      x * 2  
    end

    array = [1, 2, 3, 4, 5]
    array.define_singleton_method(:map) do |&block|
      map_called = true
      super(&block) 
    end


    apply_proc_to_array(array, spy_proc)

    $stdout = STDOUT

    expected_output = "[2, 4, 6, 8, 10]\n"

    
    assert_equal 5, proc_call_count, "Expected Proc to be called 5 times, but it wasn't."
    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
