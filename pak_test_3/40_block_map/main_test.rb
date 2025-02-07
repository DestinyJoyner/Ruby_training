require "minitest/autorun"
require_relative "main"  

class TestMapBlock < Minitest::Test
  def test_map_block
    output = StringIO.new
    $stdout = output

  
    map_called = false

   
    Array.class_eval do
      alias_method :original_map, :map  

      define_method(:map) do |&block|
        map_called = true
        original_map(&block)  
      end
    end


    load "main.rb"


    $stdout = STDOUT

    expected_output = "[2, 4, 6, 8]\n"


    Array.class_eval do
      alias_method :map, :original_map
      remove_method :original_map
    end


    assert map_called, "Expected `map` to be called, but it wasn't."
    assert_equal expected_output, output.string, "Output did not match expected result."
  end
end
