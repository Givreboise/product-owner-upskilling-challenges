require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(url, "params" => {"city" => params["location"], "search" => params["name"]})
  payload = JSON.parse(response.body)

  @activities = payload["activities"]
  @location = params["location"]

  erb :index
end

get '/activities/:id' do
  url = "https://team-building-api.cleverapps.io/v2/activities/#{params["id"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)

  @activity = payload["activity"]
  erb :activity
end
