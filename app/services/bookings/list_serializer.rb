module Bookings
  class ListSerializer
    def to_hash_conversion(bookings)
      bookings.map do |booking|
        {
          id: booking.id,
          datetime: booking.datetime.strftime("%-d %b %Y %H:%M"),
          restaurant_id: booking.restaurant_id,
          amount_of_people: booking.amount_of_people,
          customer_id: booking.customer_id
        }
      end
    end
  end
end
