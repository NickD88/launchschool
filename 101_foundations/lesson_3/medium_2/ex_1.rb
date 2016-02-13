# QUESTION 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each_pair do |name, property|
  if property["gender"] == "male"
    total_age += property["age"]
  end
end

puts "The total age of all of the males is: #{total_age}"
