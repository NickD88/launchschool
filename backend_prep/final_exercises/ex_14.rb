#In exercise 12, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
properties = [:email, :address, :phone]
n = 0

contacts.each do |name, hash|
  properties.each do |prop|
    hash[prop] = contact_data[n].shift
  end
  n += 1
end

puts contacts

#solution shows:  contacts.each_with_index do |(name, hash), idx|
#would remove the need for the n variable and use idx as the counter
