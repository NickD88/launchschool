def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga') #this modifies the original string object being passed in
  an_array_param = ['pumpkins', 'rutabaga'] #this creates a new internal variable and does not modify the original array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
