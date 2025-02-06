require "minitest/autorun"

class TestArrayModification < Minitest::Test
  def test_array_modification
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[2, 3, 4, 5]\n"
    assert_equal expected_output, output.string
  end
end
