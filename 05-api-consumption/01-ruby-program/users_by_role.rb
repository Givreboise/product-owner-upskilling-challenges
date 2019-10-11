require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."

url = "https://wagon.ilucca-demo.net/api/v3/roles"
response = RestClient.get(url, "params" => {"fields" => "name,id", "name" => role}, "Authorization" => "Lucca application=18afcfb8-697b-4742-b726-418269485cee")
roles = JSON.parse(response.body)
role_id = roles["data"]["items"][0]["id"]

p role_id

url = "https://wagon.ilucca-demo.net/api/v3/users"
response = RestClient.get(url, "params" => {"fields" => "lastName,firstName,department,jobtitle", "roleprincipalid" => role_id}, "Authorization" => "Lucca application=18afcfb8-697b-4742-b726-418269485cee")
users = JSON.parse(response.body)
user_role = users["data"]["items"]

user_role. each do |role_id|
 puts "#{role_id["firstName"]} #{role_id["lastName"]}"
 puts "#{role_id["jobTitle"]}"
 puts "---"
end
