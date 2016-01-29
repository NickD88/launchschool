#Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

arr = ["TV", "Movies", "Music"]


arr.each_with_index do |entertainment, index|
  puts "#{index + 1}. #{entertainment}"
end
