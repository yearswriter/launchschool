contact_data= [["joe@email.com", "123 Main st.", "555-123-4567"],
              ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts.each do |person,info|
  contact_data.each do |r|
    if person.downcase =~ /#{r[0].split('@')[0]}/
      r.each do |info|
        if info =~ /[A-z]+@[A-z]+\.[A-z]+/
          contacts[person][:mail]=info
        elsif info =~ /\d{3}-\d{3}-\d{4}/
          contacts[person][:phone]=info
        else
          contacts[person][:address]=info
        end
      end
    end
  end
end
print contacts
#looked at the solution - overthought it


