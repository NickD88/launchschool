class MyCar
  attr_accessor :color, :speed, :gas_mileage
  attr_reader :year, :model

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @gas_mileage = 0
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

  def calculate_gas_mileage(miles, gas_usage)
    self.gas_mileage =  miles / gas_usage
    "This #{model} is getting #{gas_mileage} miles per gallon"
  end

  def to_s
    "This car is a #{color} #{year} #{model}, that averages #{gas_mileage} miles per gallon."
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
puts car1.calculate_gas_mileage(65, 2)
puts car1
