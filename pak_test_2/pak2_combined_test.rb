# PART_2_IN_CLASS TESTS

# Folder: 18_array

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

class TestArrayAccess < Minitest::Test
  def test_array_access
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      First element: 10
      Last element: 50
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 19_each

require 'minitest/autorun'

class TestArrayModification < Minitest::Test
  def test_array_modification
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[2, 3, 4, 5]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 20_modifying_array

require 'minitest/autorun'

class TestArrayIteration < Minitest::Test
  def test_array_iteration
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      1
      4
      9
      16
      25
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 21_filter_array

require 'minitest/autorun'

class TestArrayFiltering < Minitest::Test
  def test_array_filtering
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[10, 20, 30]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 22_sorting_array

require 'minitest/autorun'

class TestArraySorting < Minitest::Test
  def test_array_sorting
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 5, 8]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 23_handle_empty_array

require 'minitest/autorun'

class TestEmptyArray < Minitest::Test
  def test_empty_array
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "Array is empty\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 24_remove_duplicates

require 'minitest/autorun'

class TestArrayUniq < Minitest::Test
  def test_remove_duplicates
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 4]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 25_handle_nil

require 'minitest/autorun'

class TestArraySortingWithNil < Minitest::Test
  def test_sorting_with_nil_values
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 5]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 26_handle_nested_array

require 'minitest/autorun'

class TestFlattenArray < Minitest::Test
  def test_flatten_array
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "[1, 2, 3, 4, 5, 6]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 27_hashes

require 'minitest/autorun'

class TestHashAccess < Minitest::Test
  def test_hash_access
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "Alice is 25 years old and lives in New York.\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 28_adding_updating

require 'minitest/autorun'

class TestHashModification < Minitest::Test
  def test_hash_modification
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "{:age=>26, :city=>\"New York\"}\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 29_iterating_over_hash

require 'minitest/autorun'

class TestHashIteration < Minitest::Test
  def test_hash_iteration
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      apple: 3
      banana: 5
      cherry: 2
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 30_merging_hashes

require 'minitest/autorun'

class TestHashMerge < Minitest::Test
  def test_hash_merge
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "{:a=>1, :b=>3, :c=>4}\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 31_missing_key

require 'minitest/autorun'

class TestHashFetch < Minitest::Test
  def test_hash_fetch
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "Unknown\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 32_handle_empty_hash

require 'minitest/autorun'

class TestEmptyHash < Minitest::Test
  def test_empty_hash
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "Hash is empty\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 33_nested_hashes

require 'minitest/autorun'

class TestNestedHash < Minitest::Test
  def test_nested_hash
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      First fiction book: 1984
      First non-fiction book: Sapiens
    OUTPUT

    assert_equal expected_output, output.string
  end
end

# Folder: 34_key_sorting

require 'minitest/autorun'

class TestHashSorting < Minitest::Test
  def test_sorting_keys_in_hash
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

    $stdout = STDOUT

    expected_output = "{:a=>1, :b=>2, :c=>3}\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 35_different_key_in_hash

require 'minitest/autorun'

class TestDifferentKeyTypes < Minitest::Test
  def test_different_key_types
    output = StringIO.new
    $stdout = output

    load 'pak2_problems.rb'

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
