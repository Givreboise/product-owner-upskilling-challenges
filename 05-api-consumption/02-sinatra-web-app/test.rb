require "json"
require "rest-client"


get "/" do
  url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)

  @activities = payload["activities"]

  p "*" * 70
  p @activities
  p "*" * 70


  erb :index
end
