Rails.application.routes.draw do
  root "pois#index" 

  resources :pois, only: [:index, :show, :new, :create]
  resources :users, only: [:new, :create]
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end