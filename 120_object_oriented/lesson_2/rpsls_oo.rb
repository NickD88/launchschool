
class Move
  attr_reader :beats, :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def move_wins?(other_move)
    beats.include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
    @beats = ['scissors', 'lizard']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @beats = ['rock', 'spock']
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @beats = ['paper', 'lizard']
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @beats = ['paper', 'spock']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @beats = ['rock', 'scissors']
  end
end

class Player
  attr_accessor :move, :name, :score, :choice_counter

  def initialize
    @move = nil
    @score = 0
    @choice_counter = {}
  end

  def convert_class(choice)
    case choice
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard' then Lizard.new
    when 'spock' then Spock.new
    end
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def set_name
    system("clear") || system("cls")
    player_name = ""
    loop do
      puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
      puts "What's your name?"
      player_name = gets.chomp
      break unless player_name.empty?
      puts "Sorry, please enter your name"
    end
    self.name = player_name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = convert_class(choice)
  end
end

class Opponent
  def self.display_opponents
    system("clear")
    puts <<~EOF
      Choose an opponent:
      1. Dracula
      2. Frankenstein
      3. Swamp Thing
      4. Yeti

      Please enter 1, 2, 3 or 4.
      You can also enter 't' to see each monster's favorite moves.
    EOF
  end

  def self.choice_to_opponent(selection)
    case selection
    when '1' then Dracula.new
    when '2' then Frankenstein.new
    when '3' then SwampThing.new
    when '4' then Yeti.new
    when 't' then display_tendencies
    end
  end

  def self.opponents_tendencies
    puts <<~EOF
      Below are the tendencies for each of the opponents.
      1. #{Dracula.tendency}
      2. #{Frankenstein.tendency}
      3. #{SwampThing.tendency}
      4. #{Yeti.tendency}

      Press return/enter to return to the opponent selection screen.
    EOF
  end

  def self.display_tendencies
    loop do
      system("clear")
      opponents_tendencies
      answer = gets.chomp
      break if answer
    end
  end
end

class Dracula < Player
  def initialize
    super
    @name = 'Dracula'
    @available_moves = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end

  def choose
    @available_moves.rotate!
    self.move = convert_class(@available_moves.last)
  end

  def self.tendency
    "Dracula likes order and chooses his moves in the order the game is named after."
  end
end

class Frankenstein < Player
  def initialize
    super
    @name = 'Frankenstein'
  end

  def choose
    self.move = convert_class(Move::VALUES.sample)
  end

  def self.tendency
    "Frankenstein doesn't like to think...so he keeps it random."
  end
end

class SwampThing < Player
  def initialize
    super
    @name = 'Swamp Thing'
  end

  def choose
    self.move = Lizard.new
  end

  def self.tendency
    "Swamp Thing loves his lizards!"
  end
end

class Yeti < Player
  def initialize
    super
    @name = 'Yeti'
  end

  def choose
    self.move = case rand(1..100)
                when (1..50) then Rock.new
                when (51..60) then Paper.new
                when (61..65) then Scissors.new
                when (66..75) then Lizard.new
                when (76..100) then Spock.new
                end
  end

  def self.tendency
    "Yet likes to throw rocks and spocks more often then not."
  end
end

class RPSGame
  attr_accessor :human, :computer, :history, :round

  WINNING_SCORE = 5
  OPPONENT_CHOICES = ['1', '2', '3', '4'].freeze

  def initialize
    @human = Human.new
    @computer = choose_opponent
    @round = 1
    @history = Hash.new
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def choose_opponent
    clear_screen
    selection = nil
    loop do
      Opponent.display_opponents
      selection = gets.chomp
      break if OPPONENT_CHOICES.include? selection
      puts "Please enter 1, 2, 3, 4"
      Opponent.choice_to_opponent(selection) if selection.casecmp('t') == 0
      sleep 0.5
    end
    Opponent.choice_to_opponent(selection)
  end

  def display_header_message
    clear_screen
    puts <<~EOF
      Good Luck #{human.name}!
      Time to play Rock, Paper, Scissors, Lizard, Spock!

      #{display_score}

    EOF
  end

  def display_human_move
    "#{human.name} chose #{human.move}."
  end

  def display_computer_move
    "#{computer.name} chose #{computer.move}"
  end

  def display_score
    "#{human.name}: #{human.score}    ||    #{computer.name}: #{computer.score}"
  end

  def display_results
    puts <<~EOF

      #{display_human_move}
      #{display_computer_move}

      #{display_winner}

    EOF
    sleep 1
  end

  def display_next_round
    puts "Get ready for round: #{round}"
    sleep 1.5
  end

  def display_goodbye_message
    puts "\npaThanks for playing!"
  end

  def display_match_end(winner)
    clear_screen
    display_header_message
    puts "#{winner.name} won the match!\n"
  end

  def determine_winner
    return human if human.move.move_wins?(computer.move)
    return computer if computer.move.move_wins?(human.move)
  end

  def display_winner
    case determine_winner
    when human
      "#{human.name} won!"
    when computer
      "#{computer.name} won!"
    else
      "It is a tie!"
    end
  end

  def update_history
    history[round] = case determine_winner
                     when human
                       [human.name, human.move.to_s, computer.move.to_s]
                     when computer
                       [computer.name, computer.move.to_s, human.move.to_s]
                     else
                       ['tied', human.move.to_s]
                     end
  end

  def display_history
    history.each do |round, outcome|
      if outcome[0] == 'tied'
        puts "Round # #{round} was a tie: both players choose #{outcome[1]}"
      else
        puts "Round # #{round}: #{outcome[0]} won: #{outcome[1]} beats #{outcome[2]}"
      end
      sleep 0.5
    end
  end

  def increment_score
    case determine_winner
    when human
      human.score += 1
    when computer
      computer.score += 1
    end
    self.round += 1
  end

  def make_choices
    human.choose
    computer.choose
  end

  def round_end_updating
    update_history
    increment_score
    display_results
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end
    clear_statistics
    answer.casecmp('y') == 0
  end

  def winning_score?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def match_winner
    return human if human.score == WINNING_SCORE
    return computer if computer.score == WINNING_SCORE
  end

  def clear_statistics
    human.score = 0
    @round = 1
    @history = Hash.new
    @computer = choose_opponent
  end

  def play
    loop do
      loop do
        display_header_message
        make_choices
        round_end_updating
        break if winning_score?
        display_next_round
      end
      display_match_end(match_winner)
      display_history
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
