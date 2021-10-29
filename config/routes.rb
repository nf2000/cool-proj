Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, :users, :homes
  resources :rooms do
    resources :bookings
  end

  resources :bookings, only: [:index]
  
  root "homes#index"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  #get "bookings", to: "bookings#index"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
