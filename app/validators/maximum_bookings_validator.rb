class MaximumBookingsValidator < ActiveModel::Validator
  def validate(record)
    restaurant_id = record.restaurant_id
    datetime = record.datetime
    bookings = Booking.where(restaurant_id: restaurant_id)
                      .where('datetime::date = ?', datetime&.to_date)

    if !is_valid?(bookings)
      record.errors.add(:bookings_count,
        "Per 1 day there may be maximum 4 bookings per restaurant"
      )
    end
  end

  def is_valid?(bookings)
    bookings.count < 4
  end
end
