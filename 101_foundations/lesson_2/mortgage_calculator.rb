require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator.yml')
LANGUAGE = 'en'

def messages(message, lan = LANGUAGE)
  MESSAGES[lan][message]
end

def prompt(key)
  message = messages(key)
  puts "#{message}"
end

def valid_number(num)
  !num.empty? && num.to_f > 0
end

def results(message)
  puts "--> #{message}"
end

prompt('welcome')

# get loan details from the user
loop do
  loan_amt = ''
  loop do
    prompt('get_loan_amount')
    loan_amt = gets.chomp
    break if valid_number(loan_amt)
    prompt("invalid_entry")
  end

  loan_apr = ''
  loop do
    prompt('get_apr')
    loan_apr = gets.chomp
    break if valid_number(loan_apr)
    prompt("invalid_entry")
  end

  term_years = ''
  loop do
    prompt('get_years')
    term_years = gets.chomp
    break if valid_number(term_years)
    prompt("invalid_entry")
  end

  # perform calculations
  term_months = term_years.to_i * 12
  anual_interest = loan_apr.to_f / 100
  monthly_interest = anual_interest/ 12
  monthly_payment = loan_amt.to_f *
                    (monthly_interest * (1 + monthly_interest)**term_months) /
                    ((1 + monthly_interest)**term_months - 1)
  total_cost = monthly_payment * term_months

  # display results
  results("The monthly payment amount is: $#{monthly_payment.round(2)}")
  results("The total number of monthly payments to be made is #{term_months}")
  results("The total cost of the loan is: $#{total_cost.round(2)}")
  sleep 1

  prompt('run_again')
  prompt('y_n_input')
  keep_running = gets.chop
  break unless keep_running.downcase.start_with?('y')
end

prompt('goodbye')
