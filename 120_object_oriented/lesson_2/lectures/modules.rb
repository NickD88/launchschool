module Swim
  def swim
    "swimming!"
  end
end

class Pet

end

class Mammal < Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Fish < Pet
  include Swim
end

class Dog < Mammal
  include Swim

  def speak
    'bark!'
  end

  def fetch
    'fetching'
  end
end

class Cat < Mammal
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Mammal.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new
flipper = Fish.new

puts pete.run                # => "running!"
# pete.speak              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
# kitty.fetch             # => NoMethodError

puts dave.speak              # => "bark!"

puts bud.run                 # => "running!"
puts bud.swim                # => "can't swim!"

puts flipper.swim
p Fish.ancestors
p Pet.ancestors
p Bulldog.ancestors
