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

# becuase self is being called within a class method, it refers to the class itself.
# in this case it refers to the Cat class
