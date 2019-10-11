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
      "price" => 120,
      "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=753&q=80"

      },

      {"name" => "Wine Testing",
      "category" => "Food",
      "city" => "Paris",
      "duration" => 90,
      "maxpax" => 15,
      "price" => 300,
      "img" => "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"

      },

      {"name" => "Beer Festival",
      "category" => "Food",
      "city" => "Lille",
      "duration" => 120,
      "maxpax" => 10,
      "price" => 80,
      "img" => "https://images.unsplash.com/photo-1532635241-17e820acc59f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1003&q=80"

      }
    ]

  erb :index

end
