#Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

puts "Type STOP to end or anything else to keep going"
input = gets.chomp

while input != "STOP" do
  puts "Enter another command, remember type STOP to exit"
  input = gets.chomp
end
