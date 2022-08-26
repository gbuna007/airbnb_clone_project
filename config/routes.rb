Rails.application.routes.draw do
  devise_for :users

  # home/landing page (a user can see all flats) DONE
  root to: "flats#home"

  # a renter can see renter dashboard (index)
  # a renter can create a booking (new, create)
  # a renter can see a booking (show)
  # a renter can edit a booking (edit, update)
  # a renter can delete a booking (delete)
  resources :bookings do
    member do
      get :payment # a renter can create a booking (booking confirmation page)
      patch :payment_update # a renter can pay (payment page)
    end
  end

  # a host can see host dashboard (index)
  # a host can create a flat (new, create)
  # a host can see a flat (show)
  # a host can edit a flat (edit, update)
  # a host can delete a flat (delete)
  # a host can accept/reject a booking
  resources :flats do
    resources :bookings, only: [:new, :create]
  end

end
