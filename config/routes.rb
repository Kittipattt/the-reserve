Rails.application.routes.draw do
  get "registrations/index"
  get "reservations/new"
  get "reservations/create"
  devise_for :users

  get "register", to: "registrations#index", as: "register"
  post "register", to: "registrations#create"  # handles form submission

  # Other routes
  get "/login", to: "sessions#index", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  get "dashboard", to: "dashboard#index", as: "dashboard"

  resources :rooms do
    member do
      get "reserve", to: "reservations#new"
      post "reserve", to: "reservations#create"
    end
  end

  resources :reservations, only: [ :new, :create ]

  root "sessions#index"
end
