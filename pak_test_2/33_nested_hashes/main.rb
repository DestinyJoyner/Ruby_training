# Creates a nested hash representing a library: { fiction: { books: ["1984", "Brave New World"] }, non_fiction: { books: ["Sapiens", "Educated"] } } Prints "First fiction book: 1984" and "First non-fiction book: Sapiens".

library = { fiction: { books: ['1984', 'Brave New World'] }, non_fiction: { books: %w[Sapiens Educated] } }

puts "First fiction book: #{library[:fiction][:books][0]}"
puts "First non-fiction book: #{library[:non_fiction][:books][0]} "
