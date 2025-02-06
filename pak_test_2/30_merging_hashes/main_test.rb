require "minitest/autorun"

class TestHashMerge < Minitest::Test
  def test_hash_merge
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "{:a=>1, :b=>3, :c=>4}\n"
    assert_equal expected_output, output.string
  end
end
