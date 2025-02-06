require "minitest/autorun"

class TestNestedHash < Minitest::Test
  def test_nested_hash
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      First fiction book: 1984
      First non-fiction book: Sapiens
    OUTPUT

    assert_equal expected_output, output.string
  end
end
