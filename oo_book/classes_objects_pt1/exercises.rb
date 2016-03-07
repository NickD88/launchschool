class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(change)
    self.speed += change
    puts "You accelerated #{change}mph."
  end

  def brake(change)
    self.speed -= change
    puts "You decelerated #{change}mph."
  end

  def turn_off
    self.speed = 0
    puts "Turn off the engine!"
  end

  def display_speed
    "#{year} #{model} is going #{speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "The color of the #{year} #{model} has been changed to #{color}."
  end
end

car1 = MyCar.new(2016, 'gray', 'cx-5')
puts car1.display_speed
car1.speed_up(20)
puts car1.display_speed
car1.brake(10)
puts car1.display_speed
car1.spray_paint('blue')
car1.turn_off
puts car1.display_speed
