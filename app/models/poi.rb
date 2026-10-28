class Poi < ApplicationRecord
  has_one_attached :cover_image
  belongs_to :user
  has_many :poi_categories, dependent: :destroy
  has_many :categories, through: :poi_categories

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :name, :category, :address, :latitude, :longitude, presence: true

  before_validation :set_default_status, on: :create

  geocoded_by :coordinates

  def coordinates
    [latitude, longitude]
  end

  scope :near_location, ->(lat, lng, radius = 20) {
    near([lat, lng], radius, units: :km) if lat.present? && lng.present?
  }
  scope :approved, -> { where(status: :approved) }

  private

  def set_default_status
    self.status ||= :pending
  end
end