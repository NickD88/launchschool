require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
PLAYER_NAME = 'Player'.freeze
COMPUTER_NAME = 'Computer'.freeze

score = { player: 0, computer: 0 }
current_player = PLAYER_NAME

def prompt(message)
  puts "=>#{message}"
end

def display_heading(hash, usr, comp)
  system("clear") || system("cls")
  puts(<<-MSG)

Welcome to the Tic-Tac-Toe Game

The input rules are: 1|2|3
                     -+-+-
                     4|5|6
                     -+-+-
                     7|8|9

You are #{PLAYER_MARKER}'s.  Computer is #{COMPUTER_MARKER}'s

** Your score is #{hash[usr]} and the computer's score is #{hash[comp]} **

MSG
end

def display_who_goes_first(player, brd)
  if detect_winner(brd) == PLAYER_NAME
    puts "#{COMPUTER_NAME} lost and will go first next round"
  elsif detect_winner(brd) == COMPUTER_NAME
    puts "#{PLAYER_NAME} lost and will go first next time"
  else
    puts "It was a tie.  #{player} will go first this time."
  end
end

def display_board(brd)
  puts(<<-MSG)

           |     |
        #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
           |     |
      -----+-----+-----
           |     |
        #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
           |     |
      -----+-----+-----
           |     |
        #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
           |     |

  MSG
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def display_joiner(arr, seperator, last_seperator='or')
  arr[-1] = "#{last_seperator} #{arr[-1]}" if arr.size > 1
  prompt "Choose a square #{arr.join(seperator)}"
end

def player_places_piece!(brd)
  square = ''
  loop do
    display_joiner(empty_squares(brd), ",")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER_NAME
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER_NAME
    end
  end
  nil
end

def increment_score(scoreboard, brd)
  scoreboard[:player] += 1 if detect_winner(brd) == PLAYER_NAME
  scoreboard[:computer] += 1 if detect_winner(brd) == COMPUTER_NAME
end

def ai_logic(brd, symbol)
  square = nil
  WINNING_LINES .each do |line|
    if brd.values_at(*line).count(symbol) == 2
      square = brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
      break
    end
  end
  square
end

def computer_defense!(brd)
  symbol = PLAYER_MARKER
  ai_logic(brd, symbol)
end

def computer_offense!(brd)
  symbol = COMPUTER_MARKER
  ai_logic(brd, symbol)
end

def center_square_open?(brd)
  if brd[5] == INITIAL_MARKER
    5
  end
end

def computer_places_piece!(brd)
  square = center_square_open?(brd)
  square = computer_offense!(brd) unless square
  square = computer_defense!(brd) unless square
  square = empty_squares(brd).sample unless square
  brd[square] = COMPUTER_MARKER
end

def alternate_player(player)
  player == PLAYER_NAME ? COMPUTER_NAME : PLAYER_NAME
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == PLAYER_NAME
  computer_places_piece!(brd) if player == COMPUTER_NAME
end

def display_winning_message(brd)
  if someone_won?(brd)
    puts "#{detect_winner(brd)} won!"
  else
    puts "It's a tie!"
  end
end

def play_again?
  prompt "Play Again? (y) to play another round"
  gets.chomp.start_with?('y', 'Y')
end

loop do
  board = initialize_board
  loop do
    display_heading(score, :player, :computer)
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  increment_score(score, board)
  display_heading(score, :player, :computer)
  display_who_goes_first(current_player, board)
  display_board(board)

  display_winning_message(board)

  break unless play_again?
end

prompt "Thank you for playing!"
