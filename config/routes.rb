Rails.application.routes.draw do
  resources :flights
  resources :bookings, only: [:new, :show, :create]

  root "flights#index"
end
