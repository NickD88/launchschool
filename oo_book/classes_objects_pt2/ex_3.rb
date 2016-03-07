class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

#The above error hasppens because attr_reader is only used as a getter method
#To fix it, name should be used for read/wright with attr_accessor method

puts bob.name
