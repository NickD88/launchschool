class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end

  def ==(other)                     
    other.is_a?(Car) && name == other.name
  end
end
