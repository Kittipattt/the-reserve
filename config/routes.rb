Rails.application.routes.draw do
  get "reservations/new"
  get "reservations/create"
  devise_for :users

  # Other routes
  get "/login", to: "sessions#new", as: "login"   # Login form route
  post "/login", to: "sessions#create"             # Login logic route
  delete "/logout", to: "sessions#destroy", as: "logout" # Logout route

  # Dashboard route
  get "dashboard", to: "dashboard#index", as: "dashboard"

  # Rooms routes
  resources :rooms do
    member do
      get 'reserve', to: 'reservations#new'  # Show the reservation form
      post 'reserve', to: 'reservations#create'  # Submit the reservation form
    end
  end

  resources :reservations, only: [:new, :create]

  # Root route
  root "sessions#new"
end
