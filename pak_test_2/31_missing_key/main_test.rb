require "minitest/autorun"

class TestHashFetch < Minitest::Test
  def test_hash_fetch
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "Unknown\n"
    assert_equal expected_output, output.string
  end
end
