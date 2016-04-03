class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # error, manufacturer is a class method
tv.model # no error

Television.manufacturer  # no error
Television.model # error, model method is only accessable by instances of the class Television
