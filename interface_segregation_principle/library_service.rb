# Interface Segregation Principle (ISP)

require_relative 'library_modules'


class LibraryService
  def add_book
    raise NotImplementedError, "Must implement add_book"
  end

  def issue_book
    raise NotImplementedError, "Must implement issue_book"
  end

  def manage_membership
    raise NotImplementedError, "Must implement manage_membership"
  end

  def reserve_online
    raise NotImplementedError, "Must implement reserve_online"
  end
end

# ✅ Works fine for libraries that support all services
class FullServiceLibrary < LibraryService
  include BookAdder
  include BookIssuer
  include MembershipManager
  include OnlineReserver
end

# 🚨 Bad for Small Libraries (they don’t support online reservations)
class SmallLibrary < LibraryService
  include BookAdder
  include BookIssuer
  include MembershipManager
  # Doesn't include OnlineReserver
end



