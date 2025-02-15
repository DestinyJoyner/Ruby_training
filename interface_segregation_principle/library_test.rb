require 'minitest/autorun'
require_relative 'library_service'

class LibraryTest < Minitest::Test
  def test_full_service_library
    library = FullServiceLibrary.new
    assert_output("Book added to library collection.\n") { library.add_book }
    assert_output("Book issued to a user.\n") { library.issue_book }
    assert_output("User membership managed.\n") { library.manage_membership }
    assert_output("Book reserved online.\n") { library.reserve_online }
  end

  def test_small_library
    library = SmallLibrary.new
    assert_output("Book added to library collection.\n") { library.add_book }
    assert_output("Book issued to a user.\n") { library.issue_book }
    assert_output("User membership managed.\n") { library.manage_membership }
    assert_raises(RuntimeError) { library.reserve_online }
  end
end
