class AddPaymentReceivedToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :payment_received, :boolean
  end
end
