class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    seperate_name(full_name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    seperate_name(full_name)
  end

  def to_s
    name
  end

  private

  def seperate_name(full_name)
    name_split = full_name.split
    @first_name = name_split.first
    @last_name = name_split.size > 1 ? name_split.last : ''
  end


end


bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob = Person.new("Robert Smith")
# puts "The person's name is: " + bob.name  // used without the to_s method
puts "The person's name is: #{bob}"
