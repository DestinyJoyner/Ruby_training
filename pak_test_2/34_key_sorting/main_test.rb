require "minitest/autorun"

class TestHashSorting < Minitest::Test
  def test_sorting_keys_in_hash
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = "{:a=>1, :b=>2, :c=>3}\n"
    assert_equal expected_output, output.string
  end
end
