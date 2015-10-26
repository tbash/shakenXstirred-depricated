Rails.application.routes.draw do
  resources :users
  get '/users/:id/ingredients',       to: 'users#show_ingredients'
  get '/users/:id/cocktails',         to: 'users#show_cocktails'
  post '/session',                    to: 'sessions#create'

  resources :ingredients
  get '/ingredients/:id/cocktails',   to: 'ingredients#show_cocktails'
  get '/ingredients/:id/users',       to: 'ingredients#show_users'

  resources :cocktails
  get '/cocktails/:id/ingredients',   to: 'cocktails#show_ingredients'
  get '/cocktails/:id/users',         to: 'cocktails#show_users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
