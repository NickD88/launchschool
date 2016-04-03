class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

bob = AngryCat.new(12, 'Bob')
kitty = AngryCat.new(4, 'kitty cat')

bob.name
kitty.age
