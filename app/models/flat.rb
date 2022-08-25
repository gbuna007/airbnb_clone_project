class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :location, :price, :num_occupants, presence: true
end
