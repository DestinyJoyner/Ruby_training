require "minitest/autorun"

class TestArrayAccess < Minitest::Test
  def test_array_access
    output = StringIO.new
    $stdout = output

    load "main.rb"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      First element: 10
      Last element: 50
    OUTPUT

    assert_equal expected_output, output.string
  end
end
