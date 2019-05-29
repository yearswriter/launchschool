contact_data= [["joe@email.com", "123 Main st.", "555-123-4567"],
              ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email,:adress,:phone]
#did not fully understood this one
contacts.each_with_index do |(name, info), idx|
  fields.each do |field|
    info[field] = contact_data[idx].shift
  end
end
print contacts


