require 'pry'

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
    set_name
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

  def increment(choice)
    if choice_counter.include?(choice)
      choice_counter[choice] += 1
    else
      choice_counter[choice] = 1
    end
  end
end


class Human < Player
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
    increment(choice)
    self.move = convert_class(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = convert_class(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :history, :round

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 1
    @history = {}
  end

  def clear_screen
    system("clear") || system("cls")
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
    puts "Thanks for playing!"
  end

  def display_match_end(winner)
    clear_screen
    display_header_message
    puts "#{winner.name} won the match!"
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
    case determine_winner
    when human
      history[round] = [human.name, human.move.to_s, computer.move.to_s]
    when computer
      history[round] = [computer.name, computer.move.to_s, human.move.to_s]
    else
      history[round] = ['tied', human.move.to_s]
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

  def update_choices
    human.choice_counter(human.move.to_s)
    computer.choice_counter(computer.move.to_s)
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

  def round_end_updating
    update_history
    increment_score
    display_results
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end
    answer.casecmp('y') == 0
  end

  def winning_score?
    human.score == 5 || computer.score == 5
  end

  def match_winner
    return human if human.score == 5
    return computer if computer.score == 5
  end

  def choose_weapon
    human.choose
    computer.choose
  end

  def play
    loop do
      loop do
        display_header_message
        choose_weapon
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
