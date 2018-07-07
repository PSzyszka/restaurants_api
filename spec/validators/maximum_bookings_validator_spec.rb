require 'rails_helper'

describe MaximumBookingsValidator do
  it 'returns nil when valid' do
    restaurant = create(:restaurant)
    create_list(
      :booking,
      3,
      restaurant: restaurant,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9)
    )
    record = double(
      :record,
      restaurant_id: restaurant.id,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9)
    )
    expect(MaximumBookingsValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false if booking count is grater than 4 and adds error' do
    bookings = %w[booking1 booking2 booking3 booking4]
    collection_of_bookings = double(:collection_of_bookings, where: bookings)
    allow(Booking).to receive(:where).and_return(collection_of_bookings)

    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: 1,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      errors: errors
    )
    expect(MaximumBookingsValidator.new.validate(record)).to eq('error')
  end

  it 'returns false when datetime is nil' do
    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: 1,
      datetime: nil,
      errors: errors
    )
    expect(MaximumBookingsValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false when restaurant is nil' do
    errors = double(:errors, add: 'error')
    record = double(
      :record,
      restaurant_id: nil,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      errors: errors
    )
    expect(MaximumBookingsValidator.new.validate(record)).to eq(nil)
  end
end
