
#3. Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

def eval_num_ifelse(num)
  if num < 0
    puts "Please input a number greater than 0"
  elsif num <= 50
    puts "#{num} is between 0 and 50"
  elsif num <= 100
    puts "#{num} is between 51 and 100"
  else
    puts "#{num} is greater than 100"
  end
end

#5 Rewrite your program from exercise 3 using a case statement. Wrap each statement in a method and make sure they both still work.
def eval_num_case(num)
  case
  when num < 0
    puts "Please input a number greater then 0"
  when num <= 50
    puts "#{num} is between 0 and 50"
  when num <= 100
    puts "#{num} is between 51 and 100"
  else
    puts "#{num} is greater than 100"
  end
end

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i

eval_num_case(number)
eval_num_ifelse(number)
