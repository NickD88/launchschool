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
