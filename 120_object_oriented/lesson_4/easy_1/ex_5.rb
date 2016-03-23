class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza       # Pizza class contains an instance variable
  def initialize(name)
    @name = name  # @name is an instance variable as noted buy the single @
  end
end

# you can also check an objects instance variables by calling the method .instance_variables
