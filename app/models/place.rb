class Place < ApplicationRecord
  has_many_attached :photos
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
