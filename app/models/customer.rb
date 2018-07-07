class Customer < ApplicationRecord
  has_many :bookings

  validates :first_name, :last_name, presence: true
  validates :phone_number, format: { with: /\A[+]\d{11}\z/ }, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9]+.[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/ }, presence: true
end
