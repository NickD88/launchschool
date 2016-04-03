class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # The following lines can be removed because we added the getter method
  #
  # def type
  #   @type
  # end
  #
  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end
