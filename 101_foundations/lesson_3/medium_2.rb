def display_answer(num)
  puts(<<-EOT)

Here are the results of exersise #{num}:
  EOT
end

# QUESTION 1
display_answer(1)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each_pair do |name, property|
  if property["gender"] == "male"
    total_age += property["age"]
  end
end

puts "The total age of all of the males is: #{total_age}"

# QUESTION 2
display_answer(2)

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, property|
  puts("#{name} is a #{property["age"]} year old #{property["gender"]}.")
end

# QUESTION 3
display_answer(3)

def not_a_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga "
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins "
my_array = ["pumpkins"]
my_string, my_array = not_a_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# QUESTION 4
display_answer(4)

sentence = "Humpty Dumpty sat on a wall."
puts sentence.split(/\W/).reverse.join(' ') + '.'

# QUESTION 5
display_answer(5)

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

puts "=> Answer is 34.  The method and new_answer variable are not called with the p method so 42-8"

# QUESTION 6
display_answer(6)

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
puts "=> The program calls the method and passes through the actual munsters array, so the data is being written to the actual munsters array "

# Question 7

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts "=> The following will print out paper"
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

#start rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#step 1: rps(rps("paper","rock"), "rock")
#step 2: rps(paper, rock)
#final will print out paper

# Question 8
def foo(param = "no")
  "yes"
end

#passing foo into bar will make param = 'yes'.  Yes is not equal to no therefor 'no' will be printed out
def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts"=> The below code will print out 'no'"
p bar(foo)
