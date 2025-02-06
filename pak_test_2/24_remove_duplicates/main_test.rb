require "minitest/autorun"

class TestArrayUniq < Minitest::Test
  def test_remove_duplicates
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 4]\n"
    assert_equal expected_output, output.string
  end
end
