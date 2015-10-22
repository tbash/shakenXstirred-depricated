Rails.application.routes.draw do
  resources :users
  get '/users/:id/ingredients',       to: 'users#show_ingredients'
  post :authentication_token,          to: 'sessions#create'

  resources :ingredients
  get '/ingredients/:id/cocktails',   to: 'ingredients#show_cocktails'
  get '/ingredients/:id/users',       to: 'ingredients#show_users'

  resources :cocktails
  get '/cocktails/:id/ingredients',   to: 'cocktails#show_ingredients'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
