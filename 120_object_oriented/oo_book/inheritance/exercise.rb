module Raceable
  def can_race?(speed)
    speed > 90 ? true : false
  end
end


class Vehicle
  @@number_vehicles = 0

  attr_accessor :color, :speed, :gas_mileage
  attr_reader :year, :model

  def self.display_vehicles
    puts "We have created #{@@number_vehicles} vehicles"
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @gas_mileage = 0
    @@number_vehicles += 1
  end

  def age
    vehicle_age = Time.now.year - self.year
    "The #{self.model} is #{vehicle_age} year(s) old."
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

  def calculate_gas_mileage(miles, gas_usage)
    self.gas_mileage =  (miles / gas_usage).round
    "This #{model} is getting #{gas_mileage} miles per gallon"
  end

  def spray_paint(color)
    self.color = color
    puts "The color of the #{year} #{model} has been changed to #{color}."
  end

  private

  def vehicle_age
    Time.now.year - self.years
  end
end

class MyCar < Vehicle
  include Raceable
  VEHICLE_TYPE = 'car'.freeze

  def to_s
    "This car is a #{self.color} #{self.year} #{self.model}, that averages #{self.gas_mileage} miles per gallon."
  end
end

class MyTruck < Vehicle
  VEHICLE_TYPE = 'truck'.freeze

  def to_s
    "This truck is a #{self.color} #{self.year} #{self.model}, that averages #{self.gas_mileage} miles per gallon."
  end
end


car1 = MyCar.new(2016, 'gray', 'cx-5')
truck1 = MyTruck.new(2012, 'black', 'tundra')
puts car1.display_speed
car1.speed_up(20)
puts car1.display_speed
car1.brake(10)
puts car1.display_speed
car1.spray_paint('blue')
car1.turn_off
puts car1.display_speed
puts car1.calculate_gas_mileage(65, 2)
puts truck1.calculate_gas_mileage(45, 6.5)
p car1.can_race?(100)
puts "***********"
puts Vehicle.ancestors
puts MyCar.ancestors
puts MyTruck.ancestors
puts "***********"
puts car1
puts truck1
puts Vehicle.display_vehicles
puts car1.age
puts truck1.age
