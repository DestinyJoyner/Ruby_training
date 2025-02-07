require "minitest/autorun"
require_relative "main" 

class TestYieldBlock < Minitest::Test
  def test_yield_block
    yield_count = 0
    output = StringIO.new
    $stdout = output


    test_proc = Proc.new do
      yield_count += 1
      puts "Hello!"
    end


    repeat_twice(&test_proc)

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello!
      Hello!
    OUTPUT

    # Assertions
    assert_equal 2, yield_count, "Expected `yield` to be called twice, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
