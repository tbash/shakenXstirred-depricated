Rails.application.routes.draw do
  resources :cocktails
  resources :ingredients
  resources :users

  root to: "cocktails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
