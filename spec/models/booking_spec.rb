require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'has a valid factory' do
    booking = build(:booking)
    expect(booking).to be_valid
  end

  it 'is invalid without restaurant_id' do
    booking = build(:booking, restaurant_id: nil)
    expect(booking).to be_invalid
  end

  it 'is invalid without customer_id' do
    booking = build(:booking, customer_id: nil)
    expect(booking).to be_invalid
  end

  it 'is invalid without amount_of_people' do
    booking = build(:booking, amount_of_people: nil)
    expect(booking).to be_invalid
  end

  it 'is invalid without datetime' do
    booking = build(:booking, datetime: nil)
    expect(booking).to be_invalid
  end

  it 'is invalid if amount_of_people is grater than 8' do
    booking = build(:booking, amount_of_people: 9)
    expect(booking).to be_invalid
  end

  it 'is invalid when time is not in range between 6 and 9 PM' do
    booking = build(:booking, datetime: DateTime.new(2001,2,3,21,7,0))
    expect(booking).to be_invalid
  end

  it 'is invalid when there are more than 4 bookings per day per restaurant ' do
    customer = create(:customer)
    restaurant = create(:restaurant)
    create_list(:booking, 4, restaurant: restaurant, customer: customer)

    booking = build(:booking, restaurant: restaurant, customer: customer)
    expect(booking).to be_invalid
  end

  it 'is invalid when total amount_of_people is grater than 8 ' do
    customer = create(:customer)
    restaurant = create(:restaurant)
    create_list(:booking, 2, restaurant: restaurant, customer: customer)

    booking = build(:booking, restaurant: restaurant, customer: customer, amount_of_people: 7)
    expect(booking).to be_invalid
  end
end
