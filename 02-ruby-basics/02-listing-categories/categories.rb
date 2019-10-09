categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

puts "Which activity would you like?"
newcategorie = gets.chomp

categories << newcategorie

categories = categories.sort

puts "[CATEGORIES OF ACTIVITIES]"

categories.each do |activity|
  puts "#{activity}"
end

puts "Total: #{categories.size}"
