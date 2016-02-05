# ask the user for two numbers
# ask the user for an operation to perform
# perform the operationon the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(lan=LANGUAGE, message)
  MESSAGES[lan][message]
end

def prompt(key)
  message = messages(key)
  puts "=> #{message}"
end

def oper_prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  word = case op
         when '1'
           MESSAGES[LANGUAGE]['add']
         when '2'
           MESSAGES[LANGUAGE]['sub']
         when '3'
           MESSAGES[LANGUAGE]['mul']
         when '4'
           MESSAGES[LANGUAGE]['div']
         end
  word
end

prompt('welcome')

name = ''
loop do
  if name.empty?
    prompt('valid_name')
    name = gets.chomp
  else
    break
  end
end

puts MESSAGES[LANGUAGE]['greeting'] + "#{name}"

loop do
  num1 = ''
  loop do
    prompt('first_number')
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt('invalid_number')
    end
  end

  num2 = ''
  loop do
    prompt('second_number')
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt('invalid_number')
    end
  end

# refactored to add language options in MESSAGES file
#  operator_prompt = <<-MSG
#    What operation would you like to perform?
#    1) add
#    2) subtract
#    3) multiply
#    4) divide
#  MSG

  prompt('operations')

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("oper_choice")
    end
  end

  puts operation_to_message(operator) + MESSAGES[LANGUAGE]['operation_call']

  result = case operator
           when '1'
             num1.to_f + num2.to_f
           when '2'
             num1.to_f - num2.to_f
           when '3'
             num1.to_f * num2.to_f
           when '4'
             num1.to_f / num2.to_f
           end

  puts MESSAGES[LANGUAGE]['result'] + "#{result}"

  prompt('run_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')
