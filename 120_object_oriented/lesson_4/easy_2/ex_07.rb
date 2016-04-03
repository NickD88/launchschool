class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# @@cats_count is a class variable.  All objects of the class share the same class variable.
# In this example, @@cats_count is  counter variable that gets incremented by one every
# time a new Cat object is created.  The below code creates two objects and then displays
# the value of the cats.count class variabe.

toby = Cat.new('black')
bob = Cat.new('brown')
p Cat.cats_count
