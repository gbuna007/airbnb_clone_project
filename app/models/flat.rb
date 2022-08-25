class Flat < ApplicationRecord
  geocoded_by :location, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :location, :price, :num_occupants, presence: true
end
