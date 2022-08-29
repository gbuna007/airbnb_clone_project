class FlatAmenity < ApplicationRecord
  belongs_to :flat, dependent: :destroy
  belongs_to :amenity
end
