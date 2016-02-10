def display_answer(num)
  puts(<<-EOT)

Here are the results of exersise #{num}:
  EOT
end

display_answer(1)
numbers = [1, 2, 2, 3]
numbers.uniq
puts numbers
puts("Output would be 1 2 2 3 as calling uniq does not mutate the array (uniq! would)")

display_answer(2)
puts (<<-EOF)
  1) != is not equal to and it is used to return boolean values
  2) ! is used before turns any object into the boolean opposite
  3) ! is used after something like uniq! to indicate it mutates the caller
  4) ? before something is the tenary operator works for if else statements
      (ex: puts 1 < 2 ? "one is less then two" : "one is not less then two")
  5) ? after something is part of the ruby name and MAY indicate it is asking a question
      (ex include? 'does it include')
  6) !! before an opject turns it into boolean quiivalent
  EOF

display_answer(3)
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
advice.gsub!('important', 'urgent')
puts advice

display_answer(4)
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
puts "delete_at(1) will delete the value in index 1 (2nd number)"
p numbers
numbers = [1, 2, 3, 4, 5]
puts "delete(1) will delete all instances of the number 1 in the array"
numbers.delete(1)
p numbers

display_answer(5)
def is_between(start, finish, num)
puts ("Is #{num} between #{start} and #{finish}")
  p (start..finish).cover?(num)
end

is_between(10, 100, 42)

display_answer(6)
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
puts famous_words
famous_words1 = "seven years ago..."
famous_words1.prepend("four score and ")
puts(famous_words1)

display_answer(7)
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
puts eval(how_deep)

display_answer(8)
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!
p flintstones

display_answer(9)
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.rassoc(2)
p flintstones.assoc("Barney")

display_answer(10)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = flintstones.map.with_index { |v, i| [v, i]}.to_h
p flintstones_hash
