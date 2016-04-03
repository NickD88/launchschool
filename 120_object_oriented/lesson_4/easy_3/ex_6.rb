class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1  # remove the self. prefix and replaced it with the instance variable marker @
  end
end

bob = Cat.new("orange")
bob.make_one_year_older
puts bob.age
