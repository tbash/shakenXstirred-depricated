Rails.application.routes.draw do
  resources :users
  post 'users/:id/update_inventory',    to: 'users#update_inventory'
  post '/session',                      to: 'sessions#create'


  resources :ingredients
  get '/ingredients/:id/cocktails',     to: 'ingredients#show_cocktails'

  resources :cocktails
  get '/cocktails/:id/ingredients',     to: 'cocktails#show_ingredients'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
