require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
      {"name" => "Knitting session",
      "category" => "DIY",
      "city" => "Nantes",
      "duration" => 60,
      "maxpax" => 4,
      "price" => 120,
      "img" => "https://images.unsplash.com/photo-1541944743827-e04aa6427c33?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=626&q=80"

      },

      {"name" => "Rafting",
        "category" => "Adventure",
        "city" => "Vezelay",
        "duration" => 120,
        "maxpax" => 10,
        "price" => 80,
        "img" => "https://images.unsplash.com/photo-1530866495561-507c9faab2ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=769&q=80"

      },

      {"name" => "Tasting gourmet teas",
        "category" => "Food",
        "city" => "London",
        "duration" => 90,
        "maxpax" => 15,
        "price" => 300,
        "img" => "https://images.unsplash.com/photo-1521012012373-6a85bade18da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80"

        },

      {"name" => "Wine Testing",
        "category" => "Food",
        "city" => "Beaunes",
        "duration" => 90,
        "maxpax" => 15,
        "price" => 300,
        "img" => "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"

        },

      {"name" => "Escape Game",
        "category" => "Adventure",
        "city" => "Nantes",
        "duration" => 60,
        "maxpax" => 4,
        "price" => 120,
        "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=753&q=80"

      },

      {"name" => "Oktoberfest",
      "category" => "Food",
      "city" => "Munich",
      "duration" => 120,
      "maxpax" => 10,
      "price" => 80,
      "img" => "https://cdn.theatlantic.com/assets/media/img/photo/2019/09/oktoberfest-2019-photos-opening-wee-1/o01_1176125103-1/original.jpg"

      }

    ]

  erb :index

end
