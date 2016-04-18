# twenty one is a card game with a player and a dealer
#
# the dealer deals two cards to player and dealer
# the player chooses to hit or stay and game over if busts
# the dealer must stay at 17 or above and hit below 17
# high score wins the game
#
#
# deck
# -deal
# player
# -hit
# -stay
# -busts
# -total
# dealer
# -hit
# -stay
# -busts
# -total
# game
# -deal

require 'pry'

class CARD
  SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
  CARD_NUMBERS = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                  "Jack", "Queen", "King", "ACE"]

  def initialize
    @suits =
    @numbers =
  end

end

class Deck

  attr_reader :cards

  def initialize
    @cards = initialize_deck
  end

end

class Participant


end

class Player < Participant


end

class Dealer < Participant


end

class Game

  def initialize
    @cards = []
    @deck = Deck.new
  end

  def play
    deal_cards
    show_cards
    # player_turn
    # delaler_turn
    # show_result
  end

  def deal_cards
    binding.pry
    @cards = @deck.initial_deal(@deck)
  end

  def show_cards
    p @cards
  end

  def player_turn

  end

  def delaler_turn

  end

  def show_result

  end

end

game = Game.new
game.play
