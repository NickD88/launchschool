#1. Write down whether the following expressions return true or false
=begin
1. (32 * 4) >= 129
2. false != !true
3. true == 4
4. false == (847 == '874')
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
=end
#answers: false, false, false, true, true

#2: Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD".


def cap(str)
  if str.length > 10
    str.upcase
  else
    str
  end
end

puts cap("heLLo WoRlD")
puts cap("smAll")

#4. What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.
=begin
1. '4' == 4 ? puts("TRUE") : puts("FALSE")

      False: string 4 and integer 4 are not equal

2. x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

      if statement returns true so "Did you get it right" is printed

3. y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end

    (x + 1) >= (y) is evaluated first and will print "Alright Now!" even though (y + 1) == x is true it is not evaluated

=end

#6 Why do you get this error and how can you fix it?
  #test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end

=begin
                def equal_to_four(x)
                  if x == 4
                    puts "yup"
                  else
                    puts "nope"
                end

                equal_to_four(5)
=end


    #There should be another end to close out the method as the end in the above program only closes out the if-else statmenet. 
