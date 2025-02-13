# Exercise: Refactor a Logging System for Flexibility and Scalability
# Exercise: Consider the following LoggerService class, which currently logs messages directly to the console. You need to refactor this class to support additional logging options, such as logging to a file and sending logs to a remote server, while keeping the design open for future extensions.
#
# Requirements:
#
# Refactor LoggerService so that it follows the Single Responsibility Principle (SRP) and Open-Closed Principle (OCP).
# Use dependency injection to allow LoggerService to accept different logging strategies.
# Design the solution to add new log destinations (such as databases or third-party monitoring services) without modifying the core LoggerService code.

class LoggerService
  def initialize(logging_methods = [])
    @logging_methods = logging_methods
  end

  def log(message)
    @logging_methods.each do |method|
      method.log_to(message)
    end
  end
end

# logging to a file
class FileLogger
  def log_to(message)
    puts "Logging to file: #{message}."
  end
end

# send to remote server
class RemoteServerLogger
  def log_to(message)
    puts "Logging to remote server: #{message}."
  end
end

# pull out current self/console logging
class ConsoleLogger
  def log_to(message)
    # puts "Log: #{message}"
    puts "Logging to console: #{message}."
  end
end

# Usage
file_log = FileLogger.new
remote_server_log = RemoteServerLogger.new
console_log = ConsoleLogger.new

log_message = 'Application started'
logging_types = [file_log, remote_server_log, console_log]

logger = LoggerService.new(logging_types)

logger.log(log_message)
