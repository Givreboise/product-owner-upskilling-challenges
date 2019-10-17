require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do
  get "/activities" do
    activities = DB.execute("SELECT * FROM activities ORDER BY name")
    json "activities" => activities
  end

  get "/activities/:id" do
    activities = DB.execute("SELECT * FROM activities WHERE id = #{params["id"]};")
    json "activities" => activities
  end

end

namespace "/v2" do
  get "/activities" do

    if params["city"] != nil
      activities = DB.execute("SELECT * FROM activities WHERE city = '#{params["city"]}';")
      json "activities" => activities

    elsif params["category"] != nil
      activities = DB.execute("SELECT * FROM activities WHERE category = '#{params["category"]}';")
      json "activities" => activities

    elsif params["search"] != nil
      activities = DB.execute("SELECT * FROM activities WHERE name LIKE '%#{params["search"]}%';")
      json "activities" => activities
    end
  end

  get "/activities/:id" do
    activities = DB.execute("SELECT * FROM activities WHERE id = #{params["id"]};")
    json "activities" => activities
  end

end

namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
