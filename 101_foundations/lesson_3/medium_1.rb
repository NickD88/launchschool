def display_answer(num)
  puts(<<-EOT)

Here are the results of exersise #{num}:
  EOT
end

display_answer(1)
10.times { |i| puts (' ' * i) + "The Flintstones Rock!"}

display_answer(2)
statement = "The Flintstones Rock"
letter_count = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  frequency = statement.scan(letter).count
  letter_count[letter] = frequency if frequency > 0
end
p letter_count

display_answer(3)
#puts "the value of 40 + 2 is " + (40 + 2)
# returns error because you can't use addition operator between strings and fixed numbers
answer = 40 + 2
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

display_answer(4)
puts(<<-MSG)
  The following will print out index 0 (num 1) and then remove
  index 0 and the array will shorten.  It will then loop printing
  index 1 (num 3) and then remove index 0. It will then reach the
  end of array and end.
MSG

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

puts(<<-MSG)
  The folling code will print out index 0 and then remove the
  last number in the array It will then print out index 1 and
  then remove the last number in the array ending the loop
MSG

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

display_answer(5)
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

p factors(35)

puts("Bonus1: this will check to make sure the number is an integer and not fraction")
puts("Divisors is put at the end of the method because that is what is being returned by the method")


display_answer(6)
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

puts("The << operator will modify the input outside of the method")
puts("While the 2nd method  will just modify within the method and not change the input argument")

display_answer(7)
limit = 15

def fib(first_num, second_num, end_limit)
  while second_num < end_limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

display_answer(8)

def titleize(string)
  puts string.split.map(&:capitalize).join(' ')
end

titleize("this is a test string!")

display_answer(9)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, values|
  case values["age"]
  when 0...18
    values["age_group"] = "kid"
  when 18...65
    values["age_group"] = "adult"
  else
    values["age_group"] = "senior"
  end
end

p munsters
