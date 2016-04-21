module Displayable
  def clear_screen
    system("clear") || system("cls")
  end

  def delay_display(message)
    sleep 0.3
    puts message
    sleep 1.5
    clear_screen
  end
end

module Hand
  def add_card(new_card)
    hand.push(new_card)
  end

  def calculate_hand_value
    hand_total = hand.reduce(0) { |total, card| total + card.points }
    ace_handling(hand_total)
  end

  def ace_handling(total)
    hand.count(&:ace?).times do
      total -= 10 if total > TwentyOneGame::TOP_SCORE
    end
    total
  end

  def busted?
    calculate_hand_value > TwentyOneGame::TOP_SCORE
  end

  def two_card_blackjack?
    calculate_hand_value == TwentyOneGame::TOP_SCORE && hand.size == 2
  end

  def busted_or_two_card_blackjack?
    two_card_blackjack? || busted?
  end
end

class Participant
  include Hand
  include Displayable

  attr_accessor :hand
  attr_reader :name

  def initialize
    @hand = []
  end

  def set_name
    clear_screen
    display_get_name_prompt
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Invalid Entry.  Please enter a valid name."
    end

    name
  end
end

class Player < Participant

  def initialize
    super
    @name = set_name
  end

  def display_get_name_prompt
    puts "Please enter your name:"
  end

  def display_hand
    hand.each_with_object("") do |card, cards_in_hand|
      cards_in_hand << "| #{card} "
    end
  end

  def stay?
    hit_or_stay == 's'
  end

  def hit_or_stay
    answer = ''
    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      puts "Please enter 'h' to hit or 's' to stay"
    end
    answer
  end
end

class Dealer < Participant
  attr_accessor :card_score_hidden

  def initialize
    super
    @name = set_name
    @card_score_hidden = true
  end

  def display_get_name_prompt
    puts "Please enter the dealer's name"
  end

  def display_hand
    if card_score_hidden
      "|  ?????  |  #{hand.last}"
    else
      hand.each_with_object("") do |card, cards_in_hand|
        cards_in_hand << "| #{card} "
      end
    end
  end

  def calculate_dealer_hand_value
    if card_score_hidden
      "????"
    else
      calculate_hand_value
    end
  end

  def reveal_cards
    self.card_score_hidden = false
  end
end

class Card
  FACE_CARDS = ["Jack", "Queen", "King"].freeze

  attr_reader :rank, :suit, :points

  def initialize(card)
    @suit = card[0]
    @rank = card[1]
    @points = calculate_value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ace?
    rank == "Ace"
  end

  private

  def face_card?
    FACE_CARDS.include?(rank)
  end

  def calculate_value
    if face_card?
      10
    elsif ace?
      11
    else
      rank.to_i
    end
  end
end

class Deck
  SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"].freeze
  CARD_RANK = [2, 3, 4, 5, 6, 7, 8, 9, 10,
               "Jack", "Queen", "King", "Ace"].freeze

  attr_reader :cards

  def initialize
    @cards = initialize_deck
    shuffle_deck
  end

  def shuffle_deck
    cards.shuffle!
  end

  def deal_one_card
    cards.pop
  end

  private

  def initialize_deck
    cards = SUITS.product(CARD_RANK)
    cards.map { |card| Card.new(card) }
  end
end

class TwentyOneGame
  include Displayable

  TOP_SCORE = 21
  DEALER_STAYS = 17

  attr_accessor :deck
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome_message
    loop do
      deal_cards
      display_game
      player_turn unless player.two_card_blackjack?
      dealer_turn unless player.busted_or_two_card_blackjack?
      display_results
      break unless play_again?
      reset_cards
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear_screen
    delay_display "Welcome to Blackjack #{player.name}"
  end

  def display_goodbye_message
    puts "Thanks for playing #{player.name}!"
  end

  def display_game
    puts <<~HEREDOC

    #{player.name}'s cards: #{player.display_hand}

    #{player.name}'s total: #{player.calculate_hand_value}

    Dealer #{dealer.name}'s Cards: #{dealer.display_hand}

    Dealer #{dealer.name}'s total: #{dealer.calculate_dealer_hand_value}

    HEREDOC
  end

  def deal_cards
    delay_display "Dealing the cards!"
    2.times do
      player.add_card(deck.deal_one_card)
      dealer.add_card(deck.deal_one_card)
    end
  end

  def player_turn
    while player.calculate_hand_value < TOP_SCORE
      break if player.stay?
      player.add_card(deck.deal_one_card)
      delay_display "#{player.name} hits!"
      display_game
    end
  end

  def dealer_turn
    dealer.reveal_cards
    display_game
    while dealer.calculate_hand_value < DEALER_STAYS
      dealer.add_card(deck.deal_one_card)
      delay_display "Dealer #{dealer.name} hits."
      display_game
    end
  end

  def player_total_higher
    player.calculate_hand_value > dealer.calculate_dealer_hand_value
  end

  def dealer_total_higher
    dealer.calculate_hand_value > player.calculate_hand_value
  end

  def tied_round?
    dealer.calculate_hand_value == player.calculate_hand_value
  end

  def other_participant
    return dealer if determine_winner == player
    return player if determine_winner == dealer
  end

  def determine_winner
    if player.two_card_blackjack?
      player
    elsif player.busted?
      dealer
    elsif dealer.busted?
      player
    elsif player_total_higher
      player
    elsif dealer_total_higher
      dealer
    end
  end

  def display_winning(participant)
    puts "#{other_participant.name} busted!" if other_participant.busted?
    puts "#{participant.name} is the winner!"
  end

  def display_results
    return puts "It's a tie" if tied_round?
    display_winning(determine_winner)
  end

  def reset_cards
    self.deck = Deck.new if deck.cards.length < 12
    player.hand = []
    dealer.hand = []
    dealer.card_score_hidden = true
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play another hand? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, please enter 'y' or 'n'"
    end

    answer == 'y'
  end
end

TwentyOneGame.new.play
