class BookingSerializer < ActiveModel::Serializer
  attributes :id, :custumer_id, :restaurant_id, :amount_of_people, :datetime
end
