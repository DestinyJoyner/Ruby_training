require "minitest/autorun"

class TestDifferentKeyTypes < Minitest::Test
  def test_different_key_types
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      name: Alice
      1: Number Key
      symbol_key: Symbol Key
      [1, 2, 3]: Array Key
    OUTPUT

    assert_equal expected_output, output.string
  end
end
