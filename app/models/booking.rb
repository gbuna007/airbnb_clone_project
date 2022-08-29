class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  has_one :review, dependent: :destroy
  validates :start_date, :end_date, :num_guests, presence: true
end
