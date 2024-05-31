Rails.application.routes.draw do
  resources :properties

  get "up" => "rails/health#show", as: :rails_health_check

  root "properties#index"
end
