# https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/ensure.html
# 
#Exception _types: https://ruby-doc.org/core-2.5.5/Exception.html
#
# BEGIN/ RESCUE/ ENSURE BLOCKS
#
# - error handling structure
# - begin/rescue -> try/catch
# - rescue -> specific error types -> can chain multiple rescue blocks
#
# - 'ensure' -> finally -> code block executes regardless of the success or failure of the begin block -> used for cleanup operations ()closing files, database connections)
# 
# - raise an error using the raise keyword followed by the error class or error message.
#
# format:
#
# begin
#   # Code that might raise an error
# rescue StandardError => e  # 'catch' in other languages
#   # Code to handle the error
# ensure  # 'finally' in other languages
#   # Code that runs no matter what (success or failure)
# end
#

begin
  file = open('/tmp/some_file', 'w')
  # ... write to the file ...
rescue StandardError
  # ... handle the exceptions ...
ensure
  file.close # ... and this always happens.
end
