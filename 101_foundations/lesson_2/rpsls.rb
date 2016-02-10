VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

score_round = {'player': 0, 'computer': 0, 'round': 1}

def score_reset(item)
  item[:player] = 0
  item[:computer] = 0
  item[:round] = 1
end

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
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'scissors' && (second == 'paper' || second == 'spock')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'rock' && (second == 'lizard' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_results(player, computer)
  prompt("You choose #{player} and the computer chose #{computer}")
  if win?(player, computer)
    prompt("*** You won this round! ***")
  elsif win?(computer, player)
    prompt("*** Computer won this round ***")
  else
    prompt("*** It is a tie! ***")
  end
end

def check_for_winner(hash, user, comp)
  hash[user] >= 5 || hash[comp] >= 5
end

def display_winner(hash, user, comp)
  if hash[user] == 5
    prompt("You won the game!")
  elsif hash[comp] == 5
    prompt("Sorry, you lost.  The computer won the game!")
  end
end

def display_instructions(round, player, computer)
  puts(<<-EOT.gsub(/^ {2}/, ''))
  Welcome to Rock, Paper, Scissors, Lizard, Spock
  The match is first to 5 wins.

  ** Your score is #{player} and the computer's score is #{computer} **

  Round #{round}.  Choose one:
    'r' for rock
    'p' for paper
    'sc' for scissors
    'l' for lizard
    'sp' for spock
  EOT
end

def play_again?
  prompt("Do you want to play again? (y) to play again")
  gets.chomp.start_with?('y', 'Y')
end

def clear_screen
  system("clear") || system("cls")
end

def increment_score(scoreboard, user, comp, user_score, comp_score)
  scoreboard[user] += 1 if win?(user_score, comp_score)
  scoreboard[comp] += 1 if win?(comp_score, user_score)
end

def increment_round(scoreboard, round_num)
  scoreboard[round_num] += 1
  prompt("Get ready for round #{scoreboard[round_num]}!")
  sleep 3
  clear_screen
end

loop do
  score_reset(score_round)
  clear_screen
  loop do
    display_instructions(score_round[:round], score_round[:player], score_round[:computer])
    choice = ''
    loop do
      choice = gets.chomp
      
      break if VALID_CHOICES.include?(letter_abreviation(choice))
      prompt("That is not a valid choice.  Please try again.")
    end

    computer_choice = VALID_CHOICES.sample

    user_choice = letter_abreviation(choice)

    display_results(user_choice, computer_choice)

    increment_score(score_round, :player, :computer, user_choice, computer_choice)

    break if check_for_winner(score_round, :player, :computer)

    increment_round(score_round, :round)
  end

  display_winner(score_round, :player, :computer)
  break unless play_again?
  clear_screen
end

prompt("Thank you for playing!")
