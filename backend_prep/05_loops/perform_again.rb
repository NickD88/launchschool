loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != "Y"
    puts "We are all done!"
    break
  end
end
