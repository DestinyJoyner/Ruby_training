say_hello = Proc.new { puts "Hello from Proc!" }

say_hello.call  # Can be executed multiple times
say_hello.call  
