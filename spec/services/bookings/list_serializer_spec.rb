require 'rails_helper'

describe Bookings::ListSerializer do
  it 'convers array to hash' do
    booking1 = double(
      id: 1,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      restaurant_id: 1,
      amount_of_people: 1,
      customer_id: 1,
      created_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00',
      updated_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00'
    )

    booking2 = double(
      id: 2,
      datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
      restaurant_id: 3,
      amount_of_people: 5,
      customer_id: 1,
      created_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00',
      updated_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00'
    )

    bookings = [booking1, booking2]

    hash = [
      {
        id: 1,
        datetime: '3 Feb 2001 20:05',
        restaurant_id: 1,
        amount_of_people: 1,
        customer_id: 1
      },
      {
        id: 2,
        datetime: '3 Feb 2001 20:05',
        restaurant_id: 3,
        amount_of_people: 5,
        customer_id: 1
      }
    ]
    expect(Bookings::ListSerializer.new.to_hash_conversion(bookings)).to eq(hash)
  end
end
