require "minitest/autorun"

class TestBlockSyntax < Minitest::Test
  def test_block_syntax
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Value: 10
      Value: 20
      Value: 30
      Value: 10
      Value: 20
      Value: 30
    OUTPUT

    assert_equal expected_output, output.string
  end
end
