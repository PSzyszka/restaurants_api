class AvailablePlacesValidator < ActiveModel::Validator
  def validate(record)
    restaurant_id = record.restaurant_id
    datetime = record.datetime
    amount_of_people = record.amount_of_people

    if !is_valid?(restaurant_id, datetime, amount_of_people)
      record.errors.add(:amount_of_people,
        "Per 1 day there may be maximum 8 people booked per restaurant"
      )
    end
  end

  def is_valid?(restaurant_id, datetime, amount_of_people)
    bookings = Booking.where(restaurant_id: restaurant_id)
                      .where('datetime::date = ?', datetime&.to_date)

    sum_of_booked_places = bookings.map { |booking| booking[:amount_of_people] }.sum
    sum_of_booked_places + amount_of_people.to_i < 9
  end
end
