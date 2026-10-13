class Poi < ApplicationRecord
  has_one_attached :cover_image

  validates :name, :category, :address, :latitude, :longitude, presence: true
end