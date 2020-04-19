Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "menus", to: "menus#index"
  get "menus/create", to: "menus#create"
  get "menus/:id", to: "menus#show"
end
