VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def letter_abreviation(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def prompt(message)
  puts("--> #{message}")
end

def win?(first, second)
  (first == 'scissors' && (second == 'paper' || second == 'spock')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'rock' && (second == 'lizard' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("*** You won this round! ***")
  elsif win?(computer, player)
    prompt("*** Computer won this round ***")
  else
    prompt("*** It is a tie! ***")
  end
end

def check_for_winner(player, computer)
  player >= 5 || computer >= 5
end

def display_winner(player, computer)
  if player == 5
    prompt("You won the game!")
  elsif computer == 5
    prompt("Sorry, you lost.  The computer won the game!")
  end
end

def display_welcome
  prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock")
  prompt("The match is first to 5 wins.")
end

def display_instructions(round)
  puts('')
  prompt("Round #{round}.  Choose one:")
  prompt("'r' for rock")
  prompt("'p' for paper")
  prompt("'sc' for scissors")
  prompt("'l' for lizard")
  prompt("'sp' for spock")
end

def play_again?
  prompt("Do you want to play again? (y) to play again")
  gets.chomp.downcase.start_with?('y')
end

loop do
  player_score = 0
  computer_score = 0
  round = 1
  display_welcome
  loop do
    display_instructions(round)
    choice = ''
    loop do
      choice = gets.chomp

      if VALID_CHOICES.include?(letter_abreviation(choice))
        break
      else
        prompt("That is not a valid choice.  Please try again.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    user_choice = letter_abreviation(choice)

    prompt("You choose #{user_choice} and the computer chose #{computer_choice}")

    display_results(user_choice, computer_choice)

    player_score += 1 if win?(user_choice, computer_choice)
    computer_score += 1 if win?(computer_choice, user_choice)

    prompt("Your score is #{player_score} and the computer's score is #{computer_score}")

    break if check_for_winner(player_score, computer_score)

    round += 1
    prompt("Get ready for round #{round}!")
    sleep 1
  end

  display_winner(player_score, computer_score)
  break unless play_again?
end

prompt("Thank you for playing!")
