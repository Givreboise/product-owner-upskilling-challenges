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
    construire la base de la query et stocker ca dans une variable
    constuire un tableau vide de filtres
    si le user filtre par city, rajouter la condition SQL dans le tabeau de filtres
    (faire de meme pour category et search)

    construire la requete SQL finale
    2 cas:
    1. on a pas de filtres
    2. on a des filtres

    executer la query
    retourner le json

    SELECT * FROM activities WHERE city = 'Nantes' AND category = 'Adventure' ..

    # if params["city"] != nil
    #   activities = DB.execute("SELECT * FROM activities WHERE city = '#{params["city"]}';")
    # elsif params["category"] != nil
    #   activities = DB.execute("SELECT * FROM activities WHERE category = '#{params["category"]}';")
    # elsif params["search"] != nil
    #   activities = DB.execute("SELECT * FROM activities WHERE name LIKE '%#{params["search"]}%';")
    # else
      activities = DB.execute("SELECT * FROM activities ORDER BY name")
    end

    json "activities" => activities
  end

  #no filters provided, only the category provided, only the city provided

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
