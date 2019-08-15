class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :image_url, presence: true
  validates :price_per_day, presence: true
  validates :capacity, presence: true
  validates :boat_type, presence: true
  validates :description, presence: true
end
