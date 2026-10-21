class Poi < ApplicationRecord
  has_one_attached :cover_image

  validates :name, :category, :address, :latitude, :longitude, presence: true

  geocoded_by :coordinates

  def coordinates
    [latitude, longitude]
  end

  scope :near_location, ->(lat, lng, radius = 20) {
    near([lat, lng], radius, units: :km) if lat.present? && lng.present?
  }
end