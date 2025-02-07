require "minitest/autorun"
require_relative "main"  

class TestProcExtraArguments < Minitest::Test
  def test_proc_with_extra_arguments
    proc_call_count = 0
    output = StringIO.new
    $stdout = output

 
    spy_proc = Proc.new do |a, b, *extra|
      proc_call_count += 1
      puts "Product: #{a * b}"
      puts "Extra arguments: #{extra.inspect}" unless extra.empty?
    end


    multiply = spy_proc
    multiply.call(3, 4)
    multiply.call(2, 3, 5, 7)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Product: 12
      Product: 6
      Extra arguments: [5, 7]
    OUTPUT

  
    assert_equal 2, proc_call_count, "Expected Proc to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
