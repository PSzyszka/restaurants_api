class BookingsController < ApplicationController
  def index
    bookings = Booking.where(restaurant_id: params[:restaurant_id])
                       .paginate(page: params[:page], per_page: 10).order(:datetime)

    bookings = Bookings::ListSerializer.new.to_hash_conversion(bookings)
    render json: bookings
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: { status: 'Cleared' }, status: 201
    else
      render json: { errors: booking.errors }, status: 422
    end
  end

  private

  def booking_params
    params.permit(:customer_id, :restaurant_id, :amount_of_people, :datetime)
  end
end
