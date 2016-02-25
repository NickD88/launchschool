TOP_SCORE = 21
DEALER_STAYS = 17
SUITS = ['Hearts', 'Spades', 'Clubs', 'Diamonds'].freeze
CARD_NUMBERS = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                'Jack', 'Queen', 'King', 'Ace'].freeze

score = { player: 0, dealer: 0 }

def initialize_deck
  CARD_NUMBERS.product(SUITS).shuffle
end

def display_heading(score_board)
  clear_screen
  puts <<~EOF
    ---BLACKJACK---

    First to 5 wins the match

    Rounds Won: Player: #{score_board[:player]}  Dealer: #{score_board[:dealer]}

  EOF
end

def display_game(player, dealer, score_board, display_dealer)
  display_heading(score_board)
  puts <<~EOF
    Player's Cards: #{display_hand(player)}
      Player's Total: #{calculate_hand_value(player)}

    Dealer's Cards: #{display_dealer_cards(dealer, display_dealer)}
      Dealer's Total: #{display_dealer_score(dealer, display_dealer)}

  EOF
end

def deal_card(deck)
  deck.delete_at(rand(deck.length))
end

def initial_deal(deck)
  2.times.collect { deal_card(deck) }
end

def card_value(card)
  case card
  when 'Ace' then 11
  when 'Jack', 'Queen', 'King' then 10
  else card.to_i
  end
end

def display_hand(hand)
  hand.each_with_object("") do |card, cards_in_hand|
    cards_in_hand << "| #{card[0]} of #{card[1]} "
  end
end

def display_dealer_cards(hand, hidden = true)
  hand.each_with_object("") do |card, cards_in_hand|
    if hidden
      cards_in_hand << "| Unknown Card "
      hidden = false
    else
      cards_in_hand << "| #{card[0]} of #{card[1]}"
    end
  end
end

def display_dealer_score(hand, hidden = true)
  hidden ? '????' : calculate_hand_value(hand)
end

def clear_screen
  system("clear") || system("cls")
end

def ace_handling(hand, hand_value)
  hand.select { |value| value == "Ace" }.count.times do
    hand_value -= 10 if hand_value > TOP_SCORE
  end
  hand_value
end

def calculate_hand_value(hand)
  values = hand.map { |value| value[0] }
  sum = 0
  values.each do |value|
    sum += card_value(value)
  end
  sum = ace_handling(values, sum)
end

def player_round(deck, score_board, player, dealer)
  loop do
    break if busted?(player) || hit_blackjack?(player)
    puts "Would you like to hit or stay? (s) to stay or any key to hit"
    break if gets.chomp.start_with?('s', 'S')
    player << deal_card(deck)
    display_game(player, dealer, score_board, true)
  end
end

def dealer_round(deck, score_board, player, dealer)
  display_game(player, dealer, score_board, false)
  puts "Dealer's turn"
  sleep 1
  loop do
    break if busted?(dealer) || hit_blackjack?(dealer)
    if dealer_hit?(calculate_hand_value(dealer))
      puts "Dealer hits"
      sleep 2
      dealer << deal_card(deck)
      display_game(player, dealer, score_board, false)
    else
      puts "Dealer stays with #{calculate_hand_value(dealer)}"
      break
    end
  end
end

def dealt_blackjack?(player_cards)
  calculate_hand_value(player_cards) == TOP_SCORE && player_cards.length == 2
end

def game_round(deck, score_board, player, dealer)
  loop do
    player_round(deck, score_board, player, dealer)
    break if busted?(player) || dealt_blackjack?(player)
    dealer_round(deck, score_board, player, dealer)
    break
  end
  display_game_results(player, dealer)
  increment_scoreboard(player, dealer, score_board)
end

def dealer_hit?(hand_value)
  hand_value < DEALER_STAYS
end

def hit_blackjack?(hand)
  calculate_hand_value(hand) == TOP_SCORE
end

def busted?(hand)
  calculate_hand_value(hand) > TOP_SCORE
end

def detect_results(player_cards, dealer_cards)
  dealer_total = calculate_hand_value(dealer_cards)
  player_total = calculate_hand_value(player_cards)
  if player_total > TOP_SCORE
    :player_busted
  elsif dealer_total > TOP_SCORE
    :dealer_busted
  elsif player_total > dealer_total
    :player_won
  elsif player_total < dealer_total
    :dealer_won
  else
    :tie
  end
end

def increment_scoreboard(player_cards, dealer_cards, score_board)
  results = detect_results(player_cards, dealer_cards)

  case results
  when :player_busted
    score_board[:dealer] += 1
  when :dealer_won
    score_board[:dealer] += 1
  when :dealer_busted
    score_board[:player] += 1
  when :player_won
    score_board[:player] += 1
  end
end

def display_game_results(player_cards, dealer_cards)
  results = detect_results(player_cards, dealer_cards)
  case results
  when :dealer_busted
    puts "Dealer busted.  You won"
  when :player_busted
    puts "You busted.  Dealer won"
  when :player_won
    puts "You won!"
  when :dealer_won
    puts "Dealer Won"
  else
    puts "It is a tie"
  end
end

def ready_next_round
  puts "\nPress Enter for next round"
  gets.chomp
end

def check_for_winner?(score_board)
  score_board[:player] >= 5 || score_board[:dealer] >= 5
end

def display_match_winner(score_board)
  if score_board[:player] == 5
    puts "\nYou won the match"
  elsif score_board[:dealer] == 5
    puts "\nDealer won the match"
  end
end

def play_again?
  puts "\nPlay another round? (y) to play another round"
  gets.chomp.start_with?('y', 'Y')
end

loop do
  game_deck = initialize_deck
  player_hand = []
  dealer_hand = []
  loop do
    if game_deck.length < 8
      puts "\nNot enough cards for a round.  Shuffling deck"
      game_deck = initialize_deck
    else
      player_hand = initial_deal(game_deck)
      dealer_hand = initial_deal(game_deck)

      display_game(player_hand, dealer_hand, score, true)

      game_round(game_deck, score, player_hand, dealer_hand)

      break if check_for_winner?(score)
      ready_next_round
    end
  end
  display_game(player_hand, dealer_hand, score, false)
  display_match_winner(score)
  break unless play_again?
end

puts "\nThanks for playing!"
