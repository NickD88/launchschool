#Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word. - "laboratory" - "experiment" - "Pans Labyrinth" - "elaborate" - "polar bear"

def sequence_appears(word)
  if /lab/.match(word)
    puts word
  else
    puts "No it does not appear"
  end
end

sequence_appears("laboratory")
sequence_appears("experiment")
sequence_appears("Pans Labryinth")
sequence_appears("elaborate")
sequence_appears("polar bear")
