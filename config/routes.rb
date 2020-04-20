Rails.application.routes.draw do
  get "/" => "home#index"

  resources :menuitems

  resources :menus

  get "/update" => "sessions#new", as: :new_sessions
  post "/create" => "sessions#create", as: :sessions
  delete "/exit" => "sessions#destroy", as: :destroy_session
end
