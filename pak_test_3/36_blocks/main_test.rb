require "minitest/autorun"

class TestEachBlock < Minitest::Test
  def test_each_block
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      2
      4
      6
      8
      10
    OUTPUT

    assert_equal expected_output, output.string
  end
end
