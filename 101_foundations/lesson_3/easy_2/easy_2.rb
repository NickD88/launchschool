def display_answer(num)
  puts(<<-EOT)

Here are the results of exersise #{num}:
  EOT
end

display_answer(1)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.has_key?('Spot')
p ages.include?('Spot')
p ages.member?('Spot')

display_answer(2)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0
answer = ages.values.each do |i|
  sum += i
end
p sum
p ages.values.inject(:+) #instructor answer

display_answer(3)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { | name, age | age >= 100 }
p ages
#ages.keep_if { | name, age | age < 100}

display_answer(4)
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize!
puts munsters_description.swapcase!
puts munsters_description.downcase!
puts munsters_description.upcase!

display_answer(5)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

display_answer(6)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts "The minimum age is #{ages.values.min}"

display_answer(7)
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('Dino')
p advice.match('house')

display_answer(8)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |n| n[0, 2] == 'Be'}

display_answer(9)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! { | x | x[0, 3]}

display_answer(10)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! { | x | x[0, 3]}
