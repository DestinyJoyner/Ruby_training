require "minitest/autorun"

class TestArrayFiltering < Minitest::Test
  def test_array_filtering
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[10, 20, 30]\n"
    assert_equal expected_output, output.string
  end
end
