# Defines a method greet that calls yield only if a block is given. Uses block_given? to prevent errors. Calls greet with and without a block.

# Output: Hello, Ruby! No block given.

def greet
  if block_given?
    yield
  end
  else
    puts "No block given."
  end
end

greet { puts "Hello, Ruby!"}
greet