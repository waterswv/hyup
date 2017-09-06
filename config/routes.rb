Rails.application.routes.draw do
  root to: "listings#index"
  get "/listings", to: "listings#index", as:"listings"
  get "/listings/new", to: "listings#new", as:"new_listing"
  post "/listings", to: "listings#create"
  get "/listings/:id", to:"listings#show", as:"listing"
  get "/listings/:id/edit", to:"listings#edit", as:"edit_listing"
  patch "/listings/:id", to:"listings#update"
  delete "/listings/:id", to:"listings#destroy"

  #signup form
  get "/user/new", to: "users#new", as:"new_user"
  post "/users", to: "users#create"
  get "/users/:id", to:"users#show", as:"user"
  get "/users/:id/edit", to:"users#edit", as:"edit_user"
  patch "/users/:id", to:"users#update"
  delete "/users/:id", to:"users#destroy"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to:"sessions#destroy"


end
