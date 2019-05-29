strings=["laboratory",
         "experiment",
         "Pans Labyrinth",
         "elaborate",
         "polar bear"]
strings.each do |member|
  puts member if member.downcase =~ /lab/
end
