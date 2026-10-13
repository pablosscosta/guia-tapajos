class Poi < ApplicationRecord
  validates :name, :category, :address, :latitude, :longitude, presence: true
end