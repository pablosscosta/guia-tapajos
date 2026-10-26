Rails.application.routes.draw do
  root "application#home"
  
  resources :pois, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :my_pois
    end
  end

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
  get "login", to: "sessions#new"
  match "logout", to: "sessions#destroy", via: [:get, :delete]

  namespace :admin do
    resources :pois do
      member do
        patch :approve
        patch :reject
      end
    end
  end
end