require "minitest/autorun"

class TestArraySorting < Minitest::Test
  def test_array_sorting
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 5, 8]\n"
    assert_equal expected_output, output.string
  end
end
