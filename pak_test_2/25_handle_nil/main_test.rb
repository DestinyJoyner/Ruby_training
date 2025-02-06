require "minitest/autorun"

class TestArraySortingWithNil < Minitest::Test
  def test_sorting_with_nil_values
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 5]\n"
    assert_equal expected_output, output.string
  end
end
