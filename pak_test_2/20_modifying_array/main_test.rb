require "minitest/autorun"

class TestArrayIteration < Minitest::Test
  def test_array_iteration
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      4
      9
      16
      25
    OUTPUT

    assert_equal expected_output, output.string
  end
end
