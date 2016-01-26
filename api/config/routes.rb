Rails.application.routes.draw do
  resources :users
  resources :ingredients, only: [:index]
  resources :cocktails,   only: [:index, :show]

  get  '/feed',             to: 'feeds#index'
  post '/sessions',         to: 'sessions#create'
  post '/update_inventory', to: 'users#update_inventory'
  post '/users/:id/follow', to: 'users#follow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
