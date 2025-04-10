Rails.application.routes.draw do
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
      get "reserve"  # This will create the room_reserve_path
    end
  end

  # Root route
  root "sessions#new"
end
