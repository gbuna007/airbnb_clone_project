class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :payment_received
      t.boolean :accepted
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.integer :num_guests

      t.timestamps
    end
  end
end
