Rails.application.routes.draw do
  devise_for :users
  resources :properties
  resources :wishlists, only: [:index, :create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check

  root "properties#index"
end
