# Defines a method repeat_twice that: Calls yield twice inside the method. Calls repeat_twice with a block that prints "Hello!".

# Notes:
# A block is a piece of code to be executed later {}
# An argument is a value passed to the method parameters ()
#
# yield-> pause here and run the BLOCK that was passed to this method (pass puts "Hello") -> block attachment to method not argument passed in ()
# ruby blocks -> callbacks in JavaScript - they're both ways to pass executable code as an argument to another function

def repeat_twice
  yield
  yield
end

repeat_twice { puts 'Hello!' }
