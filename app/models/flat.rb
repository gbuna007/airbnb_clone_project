class Flat < ApplicationRecord
  belongs_to :user
  # has_many :reviews, through: :bookings
  validates :location, :price, :occupants, presence: true
end
