# frozen_string_literal: true

require 'colorize'

module Clear
  def clear
    system("clear") || system("cls")
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts(<<-MSG)

                  |     |
               #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}
                  |     |
             -----+-----+-----
                  |     |
               #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}
                  |     |
             -----+-----+-----
                  |     |
               #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}
                  |     |

    MSG
  end

  def []=(number, marker)
    @squares[number].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def display_available(arr, seperator, last_seperator='or')
    arr[-1] = "#{last_seperator} #{arr[-1]}" if arr.size > 1
    puts "Choose a square #{arr.join(seperator)}".center(44)
  end

  def full?
    unmarked_keys.empty?
  end

  def center_square_open?
    unmarked_keys.include?(5)
  end

  def someone_won?
    !!winning_marker
  end

  def three_matching_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end

  def two_matching_markers?(squares, markers)
    squares.count { |square| square.marker == Square::INITIAL_MARKER } == 1 &&
      squares.count { |square| square.marker == markers } == 2
  end

  def find_line_only_empty(squares)
    squares.find { |square| square.marker == Square::INITIAL_MARKER }
  end

  def find_one_open_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_matching_markers?(squares, marker)
        return @squares.key(find_line_only_empty(squares))
      end
    end
    nil
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_matching_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    @marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  include Clear

  attr_accessor :score
  attr_reader :marker, :name

  def initialize(type)
    @type = type
    @name = set_name
    @marker = set_marker
    @score = 0
  end

  private

  def set_name
    prompt_set_name
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Invalid Entry.  Please enter your name."
    end

    name
  end

  def set_marker
    prompt_set_marker
    marker = nil
    loop do
      marker = gets.chomp
      break if marker.length == 1
      puts "Please enter a valid one character marker"
    end

    marker
  end

  def player_type
    return :human if @type == :human
    return :computer if @type == :computer
  end

  def prompt_set_name
    case player_type
    when :human
      puts "Please enter your name."
    when :computer
      clear
      puts "Please enter the computer's name"
    end
  end

  def prompt_set_marker
    case player_type
    when :human
      clear
      puts "Welcome #{name}! Please choose your single character marker."
    when :computer
      clear
      puts "Please choose a single character marker for #{name}"
    end
  end
end

class TTTGame
  include Clear

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  WINNING_SCORE = 5
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Player.new(:human)
    @computer = Player.new(:computer)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    loop do
      start_new_series
      play_all_rounds
      display_series_results
      break unless play_another_series?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe!"
    display_rules
  end

  def display_rules
    puts <<~MSG

    First player to win 5 games will win the series.

    The board's squares are represented by numberd choices as follows:

                         1|2|3
                         -+-+-
                         4|5|6
                         -+-+-
                         7|8|9

    Enter the corresponding square number to place your marker in the square.

    MSG
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_heading
    puts ""
    puts "#{human.name}    vs    #{computer.name}".center(44).underline
    puts "#{human.marker}     marker    #{computer.marker}".center(44)
    puts "#{human.score}     score     #{computer.score}".center(44)
  end

  def display_board
    display_heading
    board.draw
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def choose_moves
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def play_all_rounds
    loop do
      clear_screen_and_display_board
      choose_moves
      display_result
      increment_score
      sleep 1
      break if series_winner?
      display_next_round_message
      sleep 2
      reset
    end
  end

  def human_moves
    board.display_available(board.unmarked_keys, ", ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice"
    end

    board[square] = human.marker
  end

  def computer_moves
    if board.find_one_open_square(computer.marker)
      offensive_move
    elsif board.find_one_open_square(human.marker)
      defensive_move
    elsif board.center_square_open?
      choose_center_square
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def offensive_move
    board[board.find_one_open_square(computer.marker)] = computer.marker
  end

  def defensive_move
    board[board.find_one_open_square(human.marker)] = computer.marker
  end

  def choose_center_square
    board[5] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} Won!"
    else
      puts "It is a tie!"
    end
  end

  def increment_score
    human.score += 1 if board.winning_marker == human.marker
    computer.score += 1 if board.winning_marker == computer.marker
  end

  def series_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def determine_match_winner
    return human.name if human.score == WINNING_SCORE
    return computer.name if computer.score == WINNING_SCORE
  end

  def display_series_results
    clear
    puts "#{determine_match_winner} won the series!"
    puts ""
    puts "The final score is #{human.name}: #{human.score} #{computer.name}: #{computer.score}"
  end

  def play_another_series?
    answer = nil
    loop do
      puts "Would you like to play another series? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, please enter 'y' or 'n'"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def start_new_series
    board.reset
    reset_scores
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def display_next_round_message
    puts "Get ready for the next round!"
  end
end

game = TTTGame.new
game.play
