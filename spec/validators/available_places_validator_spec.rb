require 'rails_helper'

describe AvailablePlacesValidator do
  it 'returns nil when valid' do
    record = double(
      :record,
      restaurant_id: 1,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      amount_of_people: 8
    )
    expect(AvailablePlacesValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false if booking count is grater than 4 and adds error' do
    bookings = [ { amount_of_people: 1 }, { amount_of_people: 2 }, { amount_of_people: 3 }]
    collection_of_bookings = double(:collection_of_bookings, where: bookings)
    allow(Booking).to receive(:where).and_return(collection_of_bookings)

    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: 1,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      amount_of_people: 3,
      errors: errors
    )
    expect(AvailablePlacesValidator.new.validate(record)).to eq('error')
  end

  it 'returns false when amount_of_people is nil' do
    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: 1,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      amount_of_people: nil,
      errors: errors
    )
    expect(AvailablePlacesValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false when datetime is nil' do
    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: 1,
      datetime: nil,
      amount_of_people: 3,
      errors: errors
    )
    expect(AvailablePlacesValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false when restaurant is nil' do
    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: nil,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      amount_of_people: 3,
      errors: errors
    )
    expect(AvailablePlacesValidator.new.validate(record)).to eq(nil)
  end
end
