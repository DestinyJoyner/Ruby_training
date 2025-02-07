# Defines a method greet_person that yields a name to a block. Calls the method with a block that prints "Hello, Alice!".

# def single_param
# yield("Hello Destiny")  # value passed in yield method whe paused, gets subbed in for placeholder -> message (calling function with block) and executed with passed in value
# end

#  yields just the name!!
#
# single_param { |message| puts message }
def greet_person
  yield('Alice')
end

greet_person { |name| puts "Hello, #{name}!" }
