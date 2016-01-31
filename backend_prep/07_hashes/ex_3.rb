#Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

dog = {name: 'Dexter', breed: 'Puggle', weight: '32 lbs'}

p dog.each_key { |key| puts key }

p dog.each_value { |value| puts value }

dog.each do |k, v|
  puts "The dog's #{k} is #{v}"
end
