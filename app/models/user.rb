class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  enum role: { user: 0, partner:1, admin: 2 }
end