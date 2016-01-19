Rails.application.routes.draw do
  resources :users
  post '/update_inventory', to: 'users#update_inventory'
  post '/session',          to: 'sessions#create'

  resources :ingredients
  resources :cocktails
end
