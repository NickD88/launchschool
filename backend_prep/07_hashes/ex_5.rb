#What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

dog = {name: 'Dexter', breed: 'Puggle', weight: '32 lbs'}

if dog.has_value?('Dexter')
  puts "Yes the hash does contain that value"
else
  puts "Sorry the hash does not contain that value"
end
