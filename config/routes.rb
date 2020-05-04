Rails.application.routes.draw do
  get "/" => "home#index"
  get "/menu" => "menuhome#index"

  resources :menuitems

  resources :menus

  resources :users

  get "/signup" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/update" => "menusessions#new", as: :new_menusessions
  post "/create" => "menusessions#create", as: :menusessions
  delete "/exit" => "menusessions#destroy", as: :destroy_menusession
  patch "menuitems/:id", to: "menuitems#update"
  get "menus/:id/show", to: "menus#show", as: :show_menu
end
