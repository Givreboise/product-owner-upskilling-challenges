require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url        = "http://89fc2008.ngrok.io/v2/activities"
  api_params = {}

  # filtering
  if params["location"] && !params["location"].empty?
    api_params["city"] = params["location"]
  end

  response   = RestClient.get(url, params: api_params)
  payload    = JSON.parse(response.body)

  @activities = payload["activities"]

  erb :index
end

get "/activities/:id" do
  id       = params["id"]
  url      = "http://89fc2008.ngrok.io/v2/activities/#{id}"
  favorite = params["site_favorites"]
  response = RestClient.get(url)
  payload  = JSON.parse(response.body)

  @activity = payload["activity"]

  erb :show
end

post "/activities/:activity_id/wishlist" do
  activity_id = params["activity_id"]
  site_id = params[:site_id]
  url = "http://89fc2008.ngrok.io/v2/wishlist"
  response = RestClient.post(url, {site_id: site_id, activity_id: activity_id})
  redirect to("/activities/#{activity_id}")
end
