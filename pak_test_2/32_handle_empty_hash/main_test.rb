require "minitest/autorun"

class TestEmptyHash < Minitest::Test
  def test_empty_hash
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "Hash is empty\n"
    assert_equal expected_output, output.string
  end
end
