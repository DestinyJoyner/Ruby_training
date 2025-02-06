require "minitest/autorun"

class TestHashAccess < Minitest::Test
  def test_hash_access
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "Alice is 25 years old and lives in New York.\n"
    assert_equal expected_output, output.string
  end
end
