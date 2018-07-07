class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :customers, through: :bookings

  validates :name, :localization, presence: true
end
