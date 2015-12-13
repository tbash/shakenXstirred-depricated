Rails.application.routes.draw do
  resources :users
  get '/users/:id/ingredients',         to: 'users#show_ingredients'
  get '/users/:id/cocktails',           to: 'users#show_cocktails'
  post '/session',                      to: 'sessions#create'

  put 'users/:id/update_ingredients',   to: 'inventory#update_ingredients'

  resources :ingredients
  get '/ingredients/:id/cocktails',     to: 'ingredients#show_cocktails'

  resources :cocktails

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
