Rails.application.routes.draw do
  root to: "listing#index"
  get "/listings", to: "listings#index", as:"listings"
  get "/listings/new", to: "listings#new", as:"new_listing"
  post "/listings", to: "listings#create"
  get "/listings/:id", to:"listings#show", as:"listing"
  get "/listings/:id/edit", to:"listings#edit", as:"edit_listing"
  post "/listings/:id", to:"listing#update"
  delete "/listings/:id", to:"listings#destroy"

  #signup form
  get "/users/new", to: "users#new", as:"new_user"
  post "/users", to: "users#create"
  #get "/users/:id", to:"users#show", as:"user"
  get "/users/:id/edit", to:"users#edit", as:"edit_user"
  #post "/users/:id", to:"user#edit"
  #delete "/users/:id", to:"users#destroy"

  post "/login", to: "session#login"
  get "/logout", to:"session#destroy"

end
