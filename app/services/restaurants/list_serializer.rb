module Restaurants
  class ListSerializer
    def to_hash_conversion(restaurants)
      restaurants.map do |restaurant|
        {
          id: restaurant.id,
          name: restaurant.name,
          localization: restaurant.localization,
          bookings: restaurant.bookings.count
        }
      end
    end
  end
end
