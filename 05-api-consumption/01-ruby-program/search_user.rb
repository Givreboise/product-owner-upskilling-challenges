require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal
first_name, last_name = name.split

puts "Ok got it! Let's search for that person..."

url = "https://wagon.ilucca-demo.net/api/v3/users"
response = RestClient.get(url, "params" => {"fields" => "lastName,firstName,department,jobtitle", "firstName" => first_name,  "lastName"=> last_name}, "Authorization" => "Lucca application=18afcfb8-697b-4742-b726-418269485cee")
users = JSON.parse(response.body)

p users

user = users["data"]["items"][0]
puts "#{user["firstName"]} #{user["lastName"]}"
puts "#{user["jobTitle"]}"
puts "From department of #{user["department"]["name"]}"
