require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)

  @activities = payload["activities"]
  # puts "*" * 70
  # p @activities
  # puts "*" * 70

  @activities.each do |activity|
    puts "#{activity["name"]}" "#{activity["category"]}"
    puts "---"
  end

  erb :index
end
