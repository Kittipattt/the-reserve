Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  get "registrations/index"
  get "reservations/new"
  get "reservations/create"
  devise_for :users

  get "register", to: "registrations#index", as: "register"
  post "register", to: "registrations#create" 

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
  get  "password/forgot",  to: "password_resets#new",     as: :new_password_reset
  post "password/forgot",  to: "password_resets#create",  as: :password_resets

  get  "password/reset",   to: "password_resets#edit",    as: :edit_password_reset
  patch "password/update", to: "password_resets#update",  as: :password_reset




  resources :reservations, only: [ :new, :create ]



  root "sessions#index"
end
