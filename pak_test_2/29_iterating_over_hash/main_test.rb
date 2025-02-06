require "minitest/autorun"

class TestHashIteration < Minitest::Test
  def test_hash_iteration
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      apple: 3
      banana: 5
      cherry: 2
    OUTPUT

    assert_equal expected_output, output.string
  end
end
