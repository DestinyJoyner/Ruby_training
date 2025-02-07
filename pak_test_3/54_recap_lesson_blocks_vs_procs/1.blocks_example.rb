def greet
  yield if block_given?
end

greet { puts "Hello!" }  # One-time block execution
