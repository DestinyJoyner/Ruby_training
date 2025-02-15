require_relative 'library_service'

puts "=== Full Service Library ==="
full_service_library = FullServiceLibrary.new
full_service_library.add_book
full_service_library.issue_book
full_service_library.manage_membership
full_service_library.reserve_online

puts "\n=== Small Library ==="
small_library = SmallLibrary.new
small_library.add_book
small_library.issue_book
small_library.manage_membership

# Uncommenting the following line should raise an error
small_library.reserve_online
