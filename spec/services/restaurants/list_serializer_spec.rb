require 'rails_helper'

describe Restaurants::ListSerializer do
  it 'convers array to hash' do
    restaurant1_booking = double(count: 2)
    restaurant2_booking = double(count: 4)

    restaurant1 = double(
      id: 1,
      name: 'Pizza station',
      localization: 'Times squere',
      bookings: restaurant1_booking,
      created_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00',
      updated_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00'
    )

    restaurant2 = double(
      id: 2,
      name: 'next Pizza station',
      localization: 'Times squere',
      bookings: restaurant2_booking,
      created_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00',
      updated_at: 'Fri, 06 Jul 2018 09:50:17 UTC +00:00'
    )

    restaurants = [restaurant1, restaurant2]

    hash = [
      {
        id: 1,
        name: 'Pizza station',
        localization: 'Times squere',
        bookings: 2
      },
      {
        id: 2,
        name: 'next Pizza station',
        localization: 'Times squere',
        bookings: 4
      }
    ]
    expect(Restaurants::ListSerializer.new.to_hash_conversion(restaurants)).to eq(hash)
  end
end
