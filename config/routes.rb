Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  get 'products/search'

  resources :users, only: [:edit, :update]
  resources :items
  
end
