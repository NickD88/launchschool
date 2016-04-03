class Cube
  def initialize(volume)
    @volume = volume
  end

  # you can access the @volume instance variable by setting up a method within the class

  def get_volume
    @volume
  end
end

# you can also use attr_accessor for read/write attr_getter for write and attr_reader for read access
