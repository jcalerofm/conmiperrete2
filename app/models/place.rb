class Place < ApplicationRecord
  CATEGORIES = ['Playa', 'Parque']
  has_one_attached :photo
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode
  belongs_to :user
  validates  :longitude, presence: true
  validates  :latitude, presence: true
end
