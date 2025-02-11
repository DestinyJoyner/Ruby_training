# PUBLIC / PRIVATE / PROTECTED METHODS IN CLASSES

# PUBLIC methods (default):
# Can be called from anywhere
# Define the class's interface
# Usually handle main functionality

# PRIVATE methods:
# Can only be called from inside the class
# Helper methods for internal use
# Implementation details
# Can't be called with an explicit receiver (even inside class)

# USES FOR PRIVATE METHODS
# Helper calculations
# Data validation
# Logging
# Internal state management

# PROTECTED METHODS
# Can be called within the class
# Can be called by other instances of the same class
# Perfect for comparing between instances

# PUBLIC KEYWORD USAGE
# Called on parent class
# Method visibility is a class-level property
# Changes affect all instances, current and future
# It's modifying the class definition itself

# CLASS EXAMPLE:
class BankAccount
  attr_reader :balance

  def initialize(initial_balance)
    @balance = initial_balance
  end

  # Public methods (default)
  # Can be called from outside the class
  def deposit(amount)
    @balance += amount
    log_transaction('deposit', amount)  # Can call private method
  end

  def withdraw(amount)
    if sufficient_funds?(amount)        # Can call private method
      @balance -= amount
      log_transaction('withdrawal', amount)
    else
      puts 'Insufficient funds!'
    end
  end

  private # Everything below this is private

  # Private methods
  # Can only be called from inside the class
  def sufficient_funds?(amount)
    @balance >= amount
  end

  def log_transaction(type, amount)
    puts "#{type.capitalize}: $#{amount}"
  end
end

# Using the class
account = BankAccount.new(100)

# Public methods work
account.deposit(50)     # Works
account.withdraw(30)    # Works

# Private methods don't work
account.sufficient_funds?(20) # Error!
account.log_transaction('deposit', 50) # Error!
