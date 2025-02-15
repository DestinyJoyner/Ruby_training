# Interface modules for different library services
module BookAdder
  def add_book
    puts "Book added to library collection."
  end
end

module BookIssuer
  def issue_book
    puts "Book issued to a user."
  end
end

module MembershipManager
  def manage_membership
    puts "User membership managed."
  end
end

module OnlineReserver
  def reserve_online
    puts "Book reserved online."
  end
end