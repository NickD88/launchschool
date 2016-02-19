require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

score = { player: 0, computer: 0 }

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
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def increment_score(scoreboard, brd)
  scoreboard[:player] += 1 if detect_winner(brd) == 'Player'
  scoreboard[:computer] += 1 if detect_winner(brd) == 'Computer'
end

def computer_defense!(brd, line)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_offense!(brd, line)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = if brd[5] == INITIAL_MARKER
             5
           end

  if !square
    WINNING_LINES.each do |line|
      square = computer_offense!(brd, line)
      break if square
    end
  end

  if !square
    WINNING_LINES.each do |line|
      square = computer_defense!(brd, line)
      break if square
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

loop do
  board = initialize_board
  loop do
    display_heading(score, :player, :computer)
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  increment_score(score, board)
  display_heading(score, :player, :computer)
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play Again? (y) to play another round"
  answer = gets.chomp
  break unless answer.start_with?('y', 'Y')
end

prompt "Thank you for playing!"
