class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all.paginate(page: params[:page], per_page: 10)
    restaurants = Restaurants::ListSerializer.new.to_hash_conversion(restaurants)
    render json: restaurants
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      render json: { success: 'Restaurant was created successfully' }, status: 201
    else
      render json: { errors: restaurant.errors }, status: 422
    end
  end

  private

  def restaurant_params
    params.permit(:name, :localization)
  end
end
