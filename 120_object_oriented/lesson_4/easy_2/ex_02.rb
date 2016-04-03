class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future   # the choices method in the RoadTrip class will be used

# The predict_the_future method will return the string "You Will " and will
# randomly concatonate one of the phrases in the array from the choices method in the RoadTrip class.
# Ruby will first look for the method in the class that was called.  Then if it doesn't
# find the method it will look at the superclass for the method.
