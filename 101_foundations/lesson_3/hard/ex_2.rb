greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

puts "the last line will print# {a => 'hi there'}"
#informal_greeting is referenced the original greeting object
#'there' is appended to the original object so when printing the
#original object it will print out the modified object
