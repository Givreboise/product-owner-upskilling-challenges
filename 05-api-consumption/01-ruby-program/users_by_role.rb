require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."

url = "https://wagon.ilucca-demo.net/api/v3/users"
headers = { "Authorization" => "Lucca application=18afcfb8-697b-4742-b726-418269485cee"}
response = RestClient.get(url, headers)
user = JSON.parse(response.body)

p user
