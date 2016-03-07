# bob = Person.new
# bob.hi

# the following error message from the above code:

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>

# the class method .hi is a private method and can only be accessed within
# the class.  It cannot be called outside of the class.  To access the method, 
# it would need to be accessed by a public method within the class, and
# that public method can be accessed outside of the class.  Another alternative
# is to move the .hi method to a non-private or protected portion of the class.
