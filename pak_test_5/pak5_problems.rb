# PART_5_IN_CLASS

# Problem: 62_class

# Instructions:
# Write a Ruby script that:
#
# Defines a class Person with an initializer (initialize) that takes a name.
# Creates an instance of Person with the name "Alice".
# Prints "Hello, my name is Alice." using an instance method.
#
# Output:
# Hello, my name is Alice.

# Your solution for 62_class goes here:
class Person
  # in order to acess the initialized values, manually create a corresponding method for it, or use getter method
  attr_reader :name # Creates a getter method for @name

  def initialize(name)
    @name = name
  end
end

alice = Person.new('Alice')
puts "Hello, my name is #{alice.name}"

# Problem: 63_instance

# Instructions:
# Write a Ruby script that:
#
# Defines a class Car with initialize that takes make and model.
# Creates a method details that prints "This car is a <make> <model>.".
# Creates a Car instance (Toyota Camry) and calls details.
#
# Output:
# This car is a Toyota Camry.

# Your solution for 63_instance goes here:
class Car
  def initialize(make, model)
    @make = make
    @model = model
  end

  attr_reader :make, :model

  def details
    puts "This car is a #{make} #{model}"
  end
end
toyota = Car.new('Toyota', 'Camry')
toyota.details

# Problem: 64_getter_setter

# Instructions:
# Write a Ruby script that:
#
# Defines a class Book with initialize that takes title and author.
# Adds getter and setter methods for title.
# Creates a Book instance ("The Hobbit", "J.R.R. Tolkien") and:
# Reads the title.
# Changes the title to "The Lord of the Rings".
# Reads the updated title.
#
# Output:
# The Hobbit
# The Lord of the Rings

# Your solution for 64_getter_setter goes here:

class Book
  def initialize(title, author)
    @author = author
    @title = title
  end
  # attr_accessor -> getter AND setter method
  attr_accessor :title, :author
end

book1 = Book.new('The Hobbit', 'J.R.R. Tolkien')
puts book1.title
book1.title = 'The Lord of the Rings'
puts book1.title

# Problem: 65_attr_accessor

# Instructions:
# Write a Ruby script that:
#
# Defines a class Laptop with:
# Instance variables @brand and @model.
# Uses attr_accessor to create getters and setters.
# Creates an instance ("Apple", "MacBook Air") and:
# Prints its brand.
# Changes the model to "MacBook Pro".
# Prints the updated model.
#
# Output:
# Apple
# MacBook Pro

# Your solution for 65_attr_accessor goes here:

class Laptop
  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  attr_accessor :brand, :model
end

apple = Laptop.new('Apple', 'MacBook Air')
puts apple.brand
apple.model = 'MacBook Pro'
puts apple.model

# Problem: 66_instance_methods

# Instructions:
# Write a Ruby script that:
#
# Defines a class Rectangle with:
# Instance variables @width and @height.
# A method area that returns width \* height.
# Creates a Rectangle (5, 10) and prints its area.
#
# Output:
# 50

# Your solution for 66_instance_methods goes here:

class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
  end

  attr_accessor :width, :height

  def area
    width * height
  end
end

rectangle1 = Rectangle.new(5, 10)
puts rectangle1.area

# Problem: 67_class_variables

# Instructions:
# Write a Ruby script that:
#
# Defines a class Student with:
# A class variable @@count initialized to 0.
# An initialize method that increases @@count every time a student is created.
# Defines an instance method self.total_students that returns @@count.
# Creates three students and prints the total student count.
#
# Output:
# Total students: 3

# Your solution for 67_class_variables goes here:

class Student
  # class variable
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.total_students
    puts "Total students: #{@@count}"
  end
end

student1 = Student.new
student2 = Student.new
student3 = Student.new
puts Student.total_students

# Problem: 68_class_variables_2

# Instructions:
# Write a Ruby script that:
#
# Defines a class Garage with:
# A class variable @@total_cars initialized to 0.
# An initialize method that increments @@total_cars.
# Defines a class method self.total_cars that returns @@total_cars.
# Creates two cars and prints the total count.
#
# Output:
# Total cars in garage: 2

# Your solution for 68_class_variables_2 goes here:

class Garage
  @@total_cars = 0

  def initialize
    @@total_cars += 1
  end

  def self.total_cars
    @@total_cars
  end
end

car1 = Garage.new
car2 = Garage.new
puts "Total cars in garage: #{Garage.total_cars}"

# Problem: 69_class_variables_3

# Instructions:
# Write a Ruby script that:
#
# Defines a class Store with:
# A class variable @@total_sales initialized to 0.
# A method sell(amount) that adds the amount to @@total_sales.
# Defines a class method self.total_sales that returns @@total_sales.
# Creates a store and processes two sales ($100 and $250).
#
# Output:
# Total sales: $350

# Your solution for 69_class_variables_3 goes here:

class Store
  @@total_sales = 0

  def sell(amount)
    @@total_sales += amount
  end

  def self.total_sales
    @@total_sales
  end
end

store1 = Store.new
store1.sell(100)
store1.sell(250)
puts "Total Sales: $#{Store.total_sales}"

# Problem: 70_class_methods

# Instructions:
# Write a Ruby script that:
#
# Defines a class Calculator with:
# A class method self.add(a, b) that returns the sum of two numbers.
# Calls Calculator.add(4, 6) and prints the result.
#
# Output:
# 10

# Your solution for 70_class_methods goes here:
class Calculator
  def self.add(a, b)
    a + b
  end
end
puts Calculator.add(4, 6)

# Problem: 71_formatting_text_class_method

# Instructions:
# Write a Ruby script that:
#
# Defines a class TextFormatter with:
# A class method self.capitalize_all(words) that capitalizes all words in an array.
# Calls TextFormatter.capitalize_all(["hello", "world"]) and prints the result.
#
# Output:
# ["Hello", "World"]

# Your solution for 71_formatting_text_class_method goes here:
class TextFormatter
  def self.capitalize_all(words)
    words.map { |el| el.capitalize }
  end
end

puts "#{TextFormatter.capitalize_all(%w[hello world])}"

# Problem: 72_converting_temp_class_method

# Instructions:
# Write a Ruby script that:
#
# Defines a class Temperature with:
# A class method self.celsius_to_fahrenheit(celsius) that converts celsius to Fahrenheit.
# Calls Temperature.celsius_to_fahrenheit(25) and prints the result.
#
# Output:
# 77.0

# Your solution for 72_converting_temp_class_method goes here:
class Temperature
  def self.celsius_to_fahrenheit(celsius)
    # (0°C × 9/5) + 32 = 32°F
    (celsius * 9 / 5) + 32
  end
end
puts Temperature.celsius_to_fahrenheit(25)

# Problem: 73_class_tracking

# Instructions:
# Write a Ruby script that:
#
# Defines a class User with:
# A class variable @@user_count initialized to 0.
# An instance method initialize(name) that increases @@user_count when a new user is created.
# A class method self.total_users that returns @@user_count.
# Creates three users and prints the total user count.
#
# Output:
# Total users: 3

# Your solution for 73_class_tracking goes here:
class User
  @@user_count = 0

  def initialize
    @@user_count += 1
  end

  def self.total_users
    @@user_count
  end
end
user1 = User.new
user2 = User.new
user3 = User.new
puts "Total users: #{User.total_users}"

# Problem: 74_managing_library_books

# Instructions:
# Write a Ruby script that:
#
# Defines a class Library with:
# A class variable @@total_books initialized to 0.
# An instance method initialize(title) that increases @@total_books when a book is added.
# A class method self.total_books that returns @@total_books.
# Adds two books and prints the total book count.
#
# Output:
# Total books in library: 2

# Your solution for 74_managing_library_books goes here:
class Library
  @@total_books = 0

  def initialize(title)
    @title = title
    @@total_books += 1
  end

  def self.total_books
    @@total_books
  end
end

book2 = Library.new('A')
book3 = Library.new('B')
puts "Total books in library: #{Library.total_books}"

# Problem: 75_website_visitor_tracking

# Instructions:
# Write a Ruby script that:
#
# Defines a class Website with:
# A class variable @@visitor_count initialized to 0.
# An instance method visit that increases @@visitor_count.
# A class method self.total_visits that returns @@visitor_count.
# Creates a website instance and calls visit three times.
#
# Output:
# Total website visits: 3

# Your solution for 75_website_visitor_tracking goes here:
class Website
  @@visitor_count = 0

  def visit
    @@visitor_count += 1
  end

  def self.total_visits
    @@visitor_count
  end
end

website = Website.new
3.times do
  website.visit
end

puts "Total website visits:  #{Website.total_visits}"

# Problem: 76_tracking_sub_class_instances

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Vehicle with:
# A class variable @@total_vehicles initialized to 0.
# An initialize method that increments @@total_vehicles when a vehicle is created.
# A class method self.total_vehicles that returns @@total_vehicles.
# Defines two subclasses Car and Truck that inherit from Vehicle.
# Creates two cars and one truck, then prints the total count.
#
# Output:
# Total vehicles created: 3

# Your solution for 76_tracking_sub_class_instances goes here:
class Vehicle
  @@total_vehicles = 0

  def initialize
    @@total_vehicles += 1
  end

  def self.total_vehicles
    @@total_vehicles
  end
end

class CarInherit < Vehicle
end

class Truck < Vehicle
end

car3 = CarInherit.new
car4 = CarInherit.new
truck1 = Truck.new
puts "Total vehic;es created: #{Vehicle.total_vehicles}"

# Problem: 77_tracking_subclass_counts_separately

# Instructions:
# Write a Ruby script that:
#
# Defines a base class Employee with:
# A class variable @@total_employees initialized to 0.
# A hash @@subclass_counts to track each subclass separately.
# An initialize method that:
# Increments @@total_employees.
# Increments the count for the specific subclass.
# A class method self.total_employees that returns @@total_employees.
# A class method self.subclass_count(type) that returns the count for a given subclass.
# Defines two subclasses Manager and Engineer.
# Creates two engineers and one manager, then prints the total and per-subclass counts.
#
# Output:
# Total employees: 3
# Managers: 1
# Engineers: 2

# Your solution for 77_tracking_subclass_counts_separately goes here:
class Employee
  @@total_employees = 0
  @@subclass_counts = {}

  def initialize(type)
    @type = type
    @@total_employees += 1
    if @@subclass_counts.has_key?(type)
      @@subclass_counts[type] += 1
    else
      @@subclass_counts[type] = 1
    end
  end

  def self.total_employees
    @@total_employees
  end

  def self.subclass_count(type)
    @@subclass_counts[type]
  end
end

class Manager < Employee
end

class Engineer < Employee
end

engineer1 = Engineer.new('engineer')
engineer2 = Engineer.new('engineer')
manager1 = Manager.new('manager')
puts "Total employees: #{Employee.total_employees} \nManagers #{Employee.subclass_count('manager')} \nEnginners: #{Employee.subclass_count('engineer')}"

# Problem: 78_defining_public_private_methods

# Instructions:
# Write a Ruby script that:
#
# Defines a class Person with:
# A public method introduce that prints "Hi, I am <name>!".
# A private method secret that prints "This is private information.".
# Calls introduce outside the class (✅ should work).
# Calls secret outside the class (❌ should raise an error).
#
# Output:
# Hi, I am Alice!
# (main.rb):... private method `secret' called (NoMethodError)

# Your solution for 78_defining_public_private_methods goes here:
class PersonMethods
  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def introduce
    puts "Hi, I am #{name}!"
  end

  private

  def secret
    puts 'This is private information.'
  end
end

person1 = PersonMethods.new('Alice')
person1.introduce
# person1.secret

# Problem: 79_using_protected_method

# Instructions:
# Write a Ruby script that:
#
# Defines a class BankAccount with:
# An instance variable @balance.
# A protected method balance that returns the balance.
# A public method compare_balance that compares balances between two accounts.
# Creates two accounts and compares balances.
#
# Output:
# Account 1 has more money.

# Your solution for 79_using_protected_method goes here:
class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def compare_balance(other_acc)
    puts balance > other_acc.balance ? 'Account 1 has more money' : 'Account 2 has more money'
  end

  protected

  attr_reader :balance
end

acc1 = BankAccount.new(400)
acc2 = BankAccount.new(100)

acc1.compare_balance(acc2)

# Problem: 80_preventing_direct_access_to_sensitive_data

# Instructions:
# Write a Ruby script that:
#
# Defines a class Employee with:
# A private method salary_details that prints "Salary: $5000".
# A public method show_salary that internally calls salary_details.
# Calls show_salary (✅ should work).
# Calls salary_details directly (❌ should raise an error).
#
# Output:
# Salary: $5000
# (main.rb):... private method `salary_details' called (NoMethodError)

# Your solution for 80_preventing_direct_access_to_sensitive_data goes here:
class EmployeeSalary
  def show_salary
    salary_details
  end

  private

  def salary_details
    puts 'Salary: $5000'
  end
end

employee_salary = EmployeeSalary.new
employee_salary.show_salary
# employee_salary.salary_details

# Problem: 81_dynamically_changing_method_visibility

# Instructions:
# Write a Ruby script that:
#
# Defines a class Secret with:
# A public method reveal that prints "This is a public message.".
# A private method hidden_message that prints "This is a secret.".
# A class method make_public that makes hidden_message public.
# Calls reveal (✅ should work).
# Calls hidden_message (❌ should fail).
# Calls Secret.make_public and then calls hidden_message (✅ should work).
#
# Output:
# This is a public message.
# (main.rb):... private method `hidden_message' called (NoMethodError)
# This is a secret.

# Your solution for 81_dynamically_changing_method_visibility goes here:
class Secret
  def reveal
    puts 'This is a public message.'
  end

  # make hidden message public
  def self.make_public
    # Makes hidden_message public for ALL instances
    public :hidden_message
  end

  private

  def hidden_message
    puts 'This is a secret'
  end
end

public_secret = Secret.new
public_secret.reveal
# public_secret.hidden_message
Secret.make_public
public_secret.hidden_message

# Problem: 82_protecting_sensitive_data_with_password_auth

# Instructions:
# Write a Ruby script that:
#
# Defines a class UserAccount with:
# A private variable @balance.
# A public method authenticate(password) that checks a hardcoded password ("secure123").
# A private method view_balance that prints "Current balance: $5000".
# A public method show_balance(password) that calls view_balance only if authentication succeeds.
# Calls show_balance("wrongpass") (should fail).
# Calls show_balance("secure123") (should print the balance).
#
# Output:
# Authentication failed.
# Current balance: $5000

# Your solution for 82_protecting_sensitive_data_with_password_auth goes here:
class UserAccount
  def authenticate(password)
    password == 'secure123'
  end

  def show_balance(password)
    puts authenticate(password) ? view_balance : 'Authentication failed.'
  end

  private

  def initialize
    @balance = 5000
  end

  attr_reader :balance

  def view_balance
    "Current balance $#{balance}"
  end
end

user_account = UserAccount.new
user_account.show_balance('wrongpass')
user_account.show_balance('secure123')

# Problem: 83_enforcing_read_only_attr_reader

# Instructions:
# Write a Ruby script that:
#
# Defines a class Employee with:
# A read-only attribute id (cannot be modified after initialization).
# A private method generate_id that returns a random 4-digit ID.
# A public method show_id that prints "Employee ID: <id>".
# Ensures id cannot be changed after initialization.
#
# Output:
# Employee ID: 1234
# (main.rb):... undefined method `id=' (NoMethodError)

# Your solution for 83_enforcing_read_only_attr_reader goes here:
class EmployeeReadOnly
  attr_reader :id

  def initialize
    @id = generate_id
  end

  def show_id
    puts "Employee ID #{id}"
  end

  private

  def generate_id
    # random 4 digit number
    rand(1000..9999)
  end
end

employee_id = EmployeeReadOnly.new
employee_id.show_id
employee_id.id = 3456
