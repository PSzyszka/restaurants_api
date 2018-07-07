class Booking < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :restaurant
  belongs_to :customer

  validates :datetime, presence: true
  validates :amount_of_people, inclusion: { in: [*0..8] }, presence: true
  validates_with TimeReservationValidator
  validates_with AvailablePlacesValidator
  validates_with MaximumBookingsValidator
end
