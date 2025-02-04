# run ruby file -> ruby filename.rb
# IRB -> interactive Ruby -> is a REPL (read evaulate print loop) -> in terminal  type 'irb' to exit -> type 'exit'
# ruby methods no ending parenthesis

# print out to terminal -> puts
puts 2 + 2
puts 'hello'.upcase

# string interpolation
puts "lets solve 2+2 = #{2 + 2}"

# type of -> .class method
puts 'hello'.class

puts 'str' * 5

# .sub -> string replacement
# methods with arguments parenthesis are optional
puts 'hello world'.sub('hello', 'goodbye')
# .gsub -> global replace character
puts 'hello world'.gsub('l', 'r')

# .include?() method returns boolean if string includes val
puts 'hello world'.include?('hello')

# =~ ->  "pattern match" operator. It's used to test if a string matches a regular expression pattern -> returns index position where match is found or nil if no match
puts 'Hello' =~ /He/

# .match() -> /reg rexpression/
puts 'Hello world'.match(/He/)
