puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

puts "What is your year of birth?"
year_of_birth = gets.chomp.to_i

age = 2019 - year_of_birth

puts "Hey #{name} ! You are #{age} year old this year."
# TODO: your code goes here
