Rails.application.routes.draw do
  devise_for :users

  # home/landing page (a user can view all flats) DONE
  root to: "flats#home"

  # a USER can view a flat (show) DONE
  # a host can view host dashboard (index)
  # a host can create a flat (new, create)
  # a host can edit a flat (edit, update)
  # a host can delete a flat (delete)
  # a host can accept/reject a booking
  resources :flats do
    resources :bookings, only: [:new, :create]
    # new: /flats/:flat_id/bookings/new
    # create: /flats/:flat_id/bookings
  end

  # a renter can view renter dashboard (index)
  # a renter can create a booking (new, create)
  # a renter can pay for a booking (payment, payment_update)
  # a renter can view a booking (show)
  # a renter can edit a booking (edit, update)
  # a renter can delete a booking (delete)
  resources :bookings, except: [:new, :create] do
    member do
      get :payment # a renter can create a booking (booking confirmation page)
      patch :payment_update # a renter can pay for a booking (payment page)
    end
  end
end
