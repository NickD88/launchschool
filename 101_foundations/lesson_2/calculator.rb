# ask the user for two numbers
# ask the user for an operation to perform
# perform the operationon the two numbers
# output the result

puts "Welcome to the Calculator!"

puts "What is the first number?"
num1 = gets.chomp

puts "What is the second number?"
num2 = gets.chomp

puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
elsif operator == '4'
  result = num1.to_f / num2.to_f
end

puts "The result is #{result}"
