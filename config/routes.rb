Rails.application.routes.draw do
  root "pois#index"
  resources :pois, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
  get "login", to: "sessions#new"
  match "logout", to: "sessions#destroy", via: [:get, :delete] # <-- Aqui

  namespace :admin do
    resources :pois do
      member do
        patch :approve
        patch :reject
      end
    end
  end
end