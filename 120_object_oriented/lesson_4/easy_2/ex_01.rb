class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

# the predict_the_future method will return the string "You Will " and will
# randomly concatonate one of the phrases in the array from the choices method
