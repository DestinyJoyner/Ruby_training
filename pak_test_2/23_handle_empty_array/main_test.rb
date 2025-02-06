require "minitest/autorun"

class TestEmptyArray < Minitest::Test
  def test_empty_array
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "Array is empty\n"
    assert_equal expected_output, output.string
  end
end
