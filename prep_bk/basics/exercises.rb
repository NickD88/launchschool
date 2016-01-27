#Add two strings together that, when concatenated, return your first and last name as your full name in one string.

puts 'Nick ' + 'Dectis'

#Use the modulo operator, division, or a combination of both to take a 4 digit number and find 1) the thousands number 2) the hundreds 3) the tens and 4) and the ones.

puts 2158 / 1000
puts 2158 % 1000 / 100
puts 2158 % 100 / 10
puts 2158 % 10

#Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.

movies =  { movie1: 1975,
            movie2: 2004,
            movie3: 2014,
            movie4: 2001,
            movie5: 1981 }

puts movies[:movie1]
puts movies[:movie2]
puts movies[:movie3]
puts movies[:movie4]
puts movies[:movie5]

#Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.

movies_arr = [ 1975, 2004, 2014, 2001, 1981 ]

puts movies_arr[0]
puts movies_arr[1]
puts movies_arr[2]
puts movies_arr[3]
puts movies_arr[4]

#Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

puts "5! = #{5 * 4 * 3 * 2 * 1}"
puts "6! = #{6 * 5 * 4 * 3 * 2 * 1}"
puts "7! = #{7 * 6 * 5 * 4 * 3 * 2 * 1}"
puts "8! = #{8 * 7 * 6 * 5 * 4 * 3 * 2 * 1}"

#Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.

puts 4.4 * 4.4
puts 3.5 * 3.5
puts 99.33 * 99.33

#SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
#from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

    ##the interpreter is expecing a curly brace meaning there is an opening bracket without a closing bracket somewhere in the program.
