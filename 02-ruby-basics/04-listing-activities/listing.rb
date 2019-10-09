activities = [
  {"name" => "Escape Game",
  "category" => "[ADVENTURE]",
  "city" => "Nantes",
  "duration" => 60,
  "maxpax" => 4,
  "price" => 120,

  },

  {"name" => "Wine Testing",
  "category" => "[FOOD]",
  "city" => "Paris",
  "duration" => 90,
  "maxpax" => 15,
  "price" => 300,

  },

  {"name" => "Beer Festival",
  "category" => "[FOOD]",
  "city" => "Lille",
  "duration" => 120,
  "maxpax" => 10,
  "price" => 80,

  },
]

# TODO: your code goes here
activities.each do |activity|
  puts "#{activity["name"]}" "#{activity["category"]}"
  puts "Located in " "#{activity["city"]}"
  puts "Duration of " "#{activity["duration"]}" " minutes"
  puts "For " "#{activity["maxpax"]}" " participants"
  puts "Charged " "#{activity["price"]}" " €"
  puts "---"
end
