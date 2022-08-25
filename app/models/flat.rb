class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :flat_amenities
  has_many :amenities, through: :flat_amenities

  validates :name, :location, :price, :num_occupants, presence: true
end
