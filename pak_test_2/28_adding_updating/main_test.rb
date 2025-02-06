require "minitest/autorun"

class TestHashModification < Minitest::Test
  def test_hash_modification
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "{:age=>26, :city=>\"New York\"}\n"
    assert_equal expected_output, output.string
  end
end
