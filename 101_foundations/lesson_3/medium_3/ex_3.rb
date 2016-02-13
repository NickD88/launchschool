def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

#this will output "My string looks like this now: pumpkins"
#the string variable only lives within the method as a new string variable is created within the method
#this new variable only point by reference anre are not pointing to the actual object
puts "My string looks like this now: #{my_string}"

#this will output "My array looks like this now: ['pumpkins', 'rutabaga']"
#the method returns pushing 'rutabaga' into the array since the array is being passed
#into the method and it is pointing to the actual array object
puts "My array looks like this now: #{my_array}"
