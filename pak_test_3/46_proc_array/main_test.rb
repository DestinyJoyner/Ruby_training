require "minitest/autorun"
require_relative "main"  

class TestProcWithMap < Minitest::Test
  def test_proc_with_map
    proc_call_count = 0
    map_called = false
    output = StringIO.new
    $stdout = output


    spy_proc = Proc.new do |num|
      proc_call_count += 1
      num ** 2 
    end


    numbers = [1, 2, 3, 4]
    numbers.define_singleton_method(:map) do |&block|
      map_called = true
      super(&block)  
    end


    square = spy_proc
    squared_numbers = numbers.map(&square)
    puts squared_numbers.inspect

    $stdout = STDOUT

    expected_output = "[1, 4, 9, 16]\n"


    assert_equal 4, proc_call_count, "Expected Proc to be called 4 times, but it wasn't."
    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
