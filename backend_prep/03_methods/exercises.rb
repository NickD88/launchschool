#1. Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  puts "Hello " + name + " ! How are you doing?"
end

greeting("Nick")


#2. Expressions evaluate to:
  #1: 2
  #2. nil
  #3. "Joe"
  #4. "four"
  #5. nil


#3. Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 10)

#4. What is printed from the scream method is: nothing since the return is before the "puts words" therefore nothing is printed

#5. Edit the method in exercise #4 so that it does print words on the screen. 2) What does it return now?

def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")
#prints "Yippeee!!!!" but returns nil since puts always returns nul

#6. Error message below indicates the method calculate_product is expecting 2 arguments, but only 1 is passed (1 for 2)

  #ArgumentError: wrong number of arguments (1 for 2)
  #from (irb):1:in `calculate_product'
  #from (irb):4
  #from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
