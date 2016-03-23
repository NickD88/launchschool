class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

backpack = Bag.new('black', 'cloth')
p backpack    #<Bag:0x007f9b828734d8 @color="black", @material="cloth">
