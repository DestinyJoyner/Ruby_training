require "minitest/autorun"

class TestFlattenArray < Minitest::Test
  def test_flatten_array
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 4, 5, 6]\n"
    assert_equal expected_output, output.string
  end
end
