class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# self refers to the calling object of the method

sylvester = Cat.new("funny")
p sylvester   #<Cat:0x007fa52a1431e8 @type="funny", @age=0>
sylvester.make_one_year_older # self refers to the sylvester object calling make_one_year_older
p sylvester   #<Cat:0x007fa52a1431e8 @type="funny", @age=1>
