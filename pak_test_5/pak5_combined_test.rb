# PART_5_IN_CLASS

# Folder: 62_class

require 'minitest/autorun'
require_relative 'main'

class TestPersonClass < Minitest::Test
  def test_person_object
    output = StringIO.new
    $stdout = output

    person = Person.new('Alice')
    person.introduce

    $stdout = STDOUT

    expected_output = "Hello, my name is Alice.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 63_instance

require 'minitest/autorun'
require_relative 'main'

class TestCarClass < Minitest::Test
  def test_car_object
    output = StringIO.new
    $stdout = output

    car = Car.new('Toyota', 'Camry')
    car.details

    $stdout = STDOUT

    expected_output = "This car is a Toyota Camry.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 64_getter_setter

require 'minitest/autorun'
require_relative 'main'

class TestBookClass < Minitest::Test
  def test_book_object
    output = StringIO.new
    $stdout = output

    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    puts book.title
    book.title = 'The Lord of the Rings'
    puts book.title

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      The Hobbit
      The Lord of the Rings
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 65_attr_accessor

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestLaptopClass < Minitest::Test
  def test_laptop_attributes
    output = StringIO.new
    $stdout = output

    laptop = Laptop.new('Apple', 'MacBook Air')
    puts laptop.brand
    laptop.model = 'MacBook Pro'
    puts laptop.model

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Apple
      MacBook Pro
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 66_instance_methods

require 'minitest/autorun'
require_relative 'main'

class TestRectangleClass < Minitest::Test
  def test_rectangle_area
    output = StringIO.new
    $stdout = output

    rectangle = Rectangle.new(5, 10)
    puts rectangle.area

    $stdout = STDOUT

    expected_output = "50\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 67_class_variables

require 'minitest/autorun'
require_relative 'main'

class TestStudentClass < Minitest::Test
  def test_student_count
    output = StringIO.new
    $stdout = output

    Student.class_variable_set(:@@count, 0)

    student1 = Student.new('Alice')
    student2 = Student.new('Bob')
    student3 = Student.new('Charlie')

    puts "Total students: #{Student.total_students}"

    $stdout = STDOUT

    expected_output = "Total students: 3\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 68_class_variables_2

require 'minitest/autorun'
require_relative 'main'

class TestGarageClass < Minitest::Test
  def test_total_cars
    output = StringIO.new
    $stdout = output

    Garage.class_variable_set(:@@total_cars, 0)

    car1 = Garage.new('Tesla Model S')
    car2 = Garage.new('Ford Mustang')

    puts "Total cars in garage: #{Garage.total_cars}"

    $stdout = STDOUT

    expected_output = "Total cars in garage: 2\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 69_class_variables_3

require 'minitest/autorun'
require_relative 'main'

class TestStoreClass < Minitest::Test
  def test_total_sales
    output = StringIO.new
    $stdout = output

    Store.class_variable_set(:@@total_sales, 0)

    store = Store.new
    store.sell(100)
    store.sell(250)

    puts "Total sales: $#{Store.total_sales}"

    $stdout = STDOUT

    expected_output = "Total sales: $350\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 70_class_methods

require 'minitest/autorun'
require_relative 'main'

class TestCalculator < Minitest::Test
  def setup
    assert defined?(Calculator), "Expected class 'Calculator' to be defined."
    assert Calculator.respond_to?(:add), "Expected 'Calculator' to have class method 'add'."
  end

  def test_class_method_add
    output = StringIO.new
    $stdout = output

    puts Calculator.add(4, 6)

    $stdout = STDOUT

    expected_output = "10\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 71_formatting_text_class_method

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestTextFormatter < Minitest::Test
  def setup
    assert defined?(TextFormatter), "Expected class 'TextFormatter' to be defined."
    assert TextFormatter.respond_to?(:capitalize_all), "Expected 'TextFormatter' to have class method 'capitalize_all'."
  end

  def test_capitalize_all
    output = StringIO.new
    $stdout = output

    puts TextFormatter.capitalize_all(%w[hello world]).inspect

    $stdout = STDOUT

    expected_output = "[\"Hello\", \"World\"]\n"
    assert_equal expected_output, output.string
  end
end

# Folder: 72_converting_temp_class_method

require 'minitest/autorun'
require_relative 'main'

class TestTemperature < Minitest::Test
  def setup
    assert defined?(Temperature), "Expected class 'Temperature' to be defined."
    assert Temperature.respond_to?(:celsius_to_fahrenheit),
           "Expected 'Temperature' to have class method 'celsius_to_fahrenheit'."
  end

  def test_celsius_to_fahrenheit
    output = StringIO.new
    $stdout = output

    puts Temperature.celsius_to_fahrenheit(25)

    $stdout = STDOUT

    expected_output = "77.0\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 73_class_tracking

require 'minitest/autorun'
require_relative 'main'

class TestUserClass < Minitest::Test
  def setup
    assert defined?(User), "Expected class 'User' to be defined."
    assert User.respond_to?(:total_users), "Expected 'User' to have class method 'total_users'."
    User.class_variable_set(:@@user_count, 0) # Reset before tests
  end

  def test_user_count
    output = StringIO.new
    $stdout = output

    user1 = User.new('Alice')
    user2 = User.new('Bob')
    user3 = User.new('Charlie')

    puts "Total users: #{User.total_users}"

    $stdout = STDOUT

    expected_output = "Total users: 3\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 74_managing_library_books

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestLibraryClass < Minitest::Test
  def setup
    assert defined?(Library), "Expected class 'Library' to be defined."
    assert Library.respond_to?(:total_books), "Expected 'Library' to have class method 'total_books'."
    Library.class_variable_set(:@@total_books, 0) # Reset before tests
  end

  def test_total_books
    output = StringIO.new
    $stdout = output

    book1 = Library.new('The Hobbit')
    book2 = Library.new('1984')

    puts "Total books in library: #{Library.total_books}"

    $stdout = STDOUT

    expected_output = "Total books in library: 2\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 75_website_visitor_tracking

require 'minitest/autorun'
require_relative 'main'

class TestWebsiteClass < Minitest::Test
  def setup
    assert defined?(Website), "Expected class 'Website' to be defined."
    assert Website.respond_to?(:total_visits), "Expected 'Website' to have class method 'total_visits'."
    Website.class_variable_set(:@@visitor_count, 0) # Reset before tests
  end

  def test_total_visits
    output = StringIO.new
    $stdout = output

    website = Website.new
    website.visit
    website.visit
    website.visit

    puts "Total website visits: #{Website.total_visits}"

    $stdout = STDOUT

    expected_output = "Total website visits: 3\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 76_tracking_sub_class_instances

require 'minitest/autorun'
require_relative 'main'

class TestVehicleClass < Minitest::Test
  def setup
    assert defined?(Vehicle), "Expected class 'Vehicle' to be defined."
    assert Vehicle.respond_to?(:total_vehicles), "Expected 'Vehicle' to have class method 'total_vehicles'."
    Vehicle.class_variable_set(:@@total_vehicles, 0)
  end

  def test_total_vehicles
    output = StringIO.new
    $stdout = output

    car1 = Car.new
    car2 = Car.new
    truck1 = Truck.new

    puts "Total vehicles created: #{Vehicle.total_vehicles}"

    $stdout = STDOUT

    expected_output = "Total vehicles created: 3\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 77_tracking_subclass_counts_separately

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestEmployeeClass < Minitest::Test
  def setup
    assert defined?(Employee), "Expected class 'Employee' to be defined."
    assert Employee.respond_to?(:total_employees), "Expected 'Employee' to have class method 'total_employees'."
    assert Employee.respond_to?(:subclass_count), "Expected 'Employee' to have class method 'subclass_count'."
    Employee.class_variable_set(:@@total_employees, 0) # Reset before tests
    Employee.class_variable_set(:@@subclass_counts, Hash.new(0)) # Reset before tests
  end

  def test_employee_count
    output = StringIO.new
    $stdout = output

    engineer1 = Engineer.new
    engineer2 = Engineer.new
    manager1 = Manager.new

    puts "Total employees: #{Employee.total_employees}"
    puts "Managers: #{Employee.subclass_count(Manager)}"
    puts "Engineers: #{Employee.subclass_count(Engineer)}"

    $stdout = STDOUT

    expected_output = <<~OUTPUT
      Total employees: 3
      Managers: 1
      Engineers: 2
    OUTPUT

    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 78_defining_public_private_methods

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestPersonClass < Minitest::Test
  def setup
    assert defined?(Person), "Expected class 'Person' to be defined."
    @person = Person.new('Alice') # Create an instance for reuse
  end

  def test_public_introduce
    output = StringIO.new
    $stdout = output

    @person.introduce

    $stdout = STDOUT

    expected_output = "Hi, I am Alice!\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_private_method_secret
    assert_raises(NoMethodError) { @person.secret }
  end

  def test_private_method_access_attempt
    exception = assert_raises(NoMethodError) { @person.secret }
    assert_match(/private method `secret' called/, exception.message,
                 'Expected a NoMethodError with a message about a private method call.')
  end

  def test_private_method_access_attempt_send
    output = StringIO.new
    $stdout = output

    @person.send(:secret)

    $stdout = STDOUT
    expected_output = "This is private information.\n"
    assert_equal expected_output, output.string, 'Using send should bypass the method visibility'
  end
end

# Folder: 79_using_protected_method

require 'minitest/autorun'
require_relative 'main' # Ensure main.rb is loaded

class TestBankAccount < Minitest::Test
  def setup
    assert defined?(BankAccount), "Expected class 'BankAccount' to be defined."
  end

  def test_compare_balance
    output = StringIO.new
    $stdout = output

    account1 = BankAccount.new(500)
    account2 = BankAccount.new(300)

    account1.compare_balance(account2)

    $stdout = STDOUT

    expected_output = "Account 1 has more money.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_protected_balance
    account = BankAccount.new(500)
    assert_raises(NoMethodError) { account.balance }
  end
end

# Folder: 80_preventing_direct_access_to_sensitive_data

require 'minitest/autorun'
require_relative 'main'

class TestEmployee < Minitest::Test
  def setup
    assert defined?(Employee), "Expected class 'Employee' to be defined."
  end

  def test_show_salary
    output = StringIO.new
    $stdout = output

    employee = Employee.new
    employee.show_salary

    $stdout = STDOUT

    expected_output = "Salary: $5000\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_private_salary_details
    employee = Employee.new
    assert_raises(NoMethodError) { employee.salary_details }
  end
end

# Folder: 81_dynamically_changing_method_visibility

require 'minitest/autorun'
require_relative 'main'

class TestSecret < Minitest::Test
  def setup
    assert defined?(Secret), "Expected class 'Secret' to be defined."
    Secret.class_eval { private :hidden_message }
  end

  def test_reveal_message
    output = StringIO.new
    $stdout = output

    secret = Secret.new
    secret.reveal

    $stdout = STDOUT

    expected_output = "This is a public message.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_hidden_message_private
    secret = Secret.new
    assert_raises(NoMethodError) { secret.hidden_message }
  end

  def test_hidden_message_made_public
    Secret.make_public
    output = StringIO.new
    $stdout = output

    secret = Secret.new
    secret.hidden_message

    $stdout = STDOUT

    expected_output = "This is a secret.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end
end

# Folder: 82_protecting_sensitive_data_with_password_auth

require 'minitest/autorun'
require_relative 'main'

class TestUserAccount < Minitest::Test
  def setup
    assert defined?(UserAccount), "Expected class 'UserAccount' to be defined."
  end

  def test_wrong_password
    output = StringIO.new
    $stdout = output

    account = UserAccount.new
    account.show_balance('wrongpass')

    $stdout = STDOUT

    expected_output = "Authentication failed.\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_correct_password
    output = StringIO.new
    $stdout = output

    account = UserAccount.new
    account.show_balance('secure123')

    $stdout = STDOUT

    expected_output = "Current balance: $5000\n"
    assert_equal expected_output, output.string, 'Output did not match expected result.'
  end

  def test_private_view_balance
    account = UserAccount.new
    assert_raises(NoMethodError) { account.view_balance }
  end
end

# Folder: 83_enforcing_read_only_attr_reader

require 'minitest/autorun'
require_relative 'main'

class TestEmployee < Minitest::Test
  def setup
    assert defined?(Employee), "Expected class 'Employee' to be defined."
  end

  def test_show_id
    output = StringIO.new
    $stdout = output

    employee = Employee.new
    employee.show_id

    $stdout = STDOUT

    assert_match(/Employee ID: \d{4}\n/, output.string, 'Output did not match expected format.')
  end

  def test_generate_id_private
    employee = Employee.new
    assert_raises(NoMethodError) { employee.generate_id }
  end

  def test_id_read_only
    employee = Employee.new
    assert_raises(NoMethodError) { employee.id = 9999 }
  end
end
