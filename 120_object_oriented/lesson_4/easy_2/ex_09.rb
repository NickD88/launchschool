class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Start the Bingo game!"
  end
end

game1 = Bingo.new
game1.play # will return "Start the Bingo game!"

# Ruby will first look in the class that is called for the method before
# looking in the super-class that it is inheriting from.
