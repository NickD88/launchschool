def display_answer(num)
  puts(<<-EOT)

Here are the results of exersise #{num}:
  EOT
end

display_answer(1)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones_easy = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones_easy

display_answer(2)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

display_answer(3)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")
p flintstones

display_answer(4)
advice = "Few things in life are as important as house training your pet dinosaur."
# my solution: advice.slice!("Few things in life are as important as ")
advice.slice!(0, advice.index('house'))
puts advice
advice1 = "Few things in life are as important as house training your pet dinosaur."
puts advice1.slice(0, advice1.index('house')) #returns the sliced string but does not mutate caller
puts advice1

display_answer(5)
statement = "The Flintstones Rock!"
p statement.count('t')

display_answer(6)
title = "Flintstone Family Members"
p title.center(40)
