require "minitest/autorun"
require_relative "main"  # Ensure main.rb is loaded

class TestYieldWithNoBlock < Minitest::Test
  def test_yield_with_no_block
    yield_count = 0
    output = StringIO.new
    $stdout = output


    test_proc = Proc.new do
      yield_count += 1
      puts "Hello, Ruby!"
    end


    greet(&test_proc)
    greet

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Hello, Ruby!
      No block given.
    OUTPUT


    assert_equal 1, yield_count, "Expected `yield` to be called once, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
