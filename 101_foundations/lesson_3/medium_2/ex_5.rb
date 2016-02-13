# QUESTION 5

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

puts "=> Answer is 34.  The method and new_answer variable are not called with the p method so 42-8"
