class Flat < ApplicationRecord
  geocoded_by :location, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :flat_amenities, dependent: :destroy
  has_many :amenities, through: :flat_amenities
  has_many_attached :photos
  accepts_nested_attributes_for :amenities
  validates :name, :location, :price, :num_occupants, presence: true
end
