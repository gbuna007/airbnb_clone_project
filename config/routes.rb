Rails.application.routes.draw do
  devise_for :users

  # ALL USERS
  # a user can see all flats
  # /
  root to: "flats#index"

  # a user can see a specific flat
  # /flats/:flat_id
  resources :flats, only: %i[show]

  # resources :bookings, only: %i[show]

  # RENTERS/HOSTS
  # a renter can create a booking (confirmation page)
  resources :bookings do
    member do
      get :payment
    end
  end

  # a renter can see the renter dashboard
  resources :users do
    resources :bookings
    resources :flats
  end

  resources :flats do
    resources :bookings, only: %i[new create]
  end
end
