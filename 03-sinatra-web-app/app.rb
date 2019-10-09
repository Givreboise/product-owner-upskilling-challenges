require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
      {"name" => "Escape Game",
      "category" => "Adventure",
      "city" => "Nantes",
      "duration" => 60,
      "maxpax" => 4,
      "price" => 120

      },

      {"name" => "Wine Testing",
      "category" => "Food",
      "city" => "Paris",
      "duration" => 90,
      "maxpax" => 15,
      "price" => 300

      },

      {"name" => "Beer Festival",
      "category" => "Food",
      "city" => "Lille",
      "duration" => 120,
      "maxpax" => 10,
      "price" => 80

      }
    ]

  erb :index

end
