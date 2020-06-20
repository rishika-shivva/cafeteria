Rails.application.routes.draw do
  get "/", to: "home#index"
  patch "/orders/pay", to: "orders#pay"
  post "/orders/addmore", to: "orders#addmore"
  get "/orders/cart", to: "orders#cart", as: :cart
  get "/menus/edit", to: "menus#edit", as: :menus_edit
  get "/menus/show", to: "menus#show", as: :menus_show
  get "/reports" => "reports#index", as: :reports
  get "/reports/:id" => "reports#invoice", as: :invoice
  resources :menus
  resources :users
  resources :menuitems
  resources :orders
  resources :orderitems
  post "/menus/setmenu", to: "menus#set", as: :setmenu
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
  get "/newclerk", to:"users#newclerk", as: :new_clerk
end
