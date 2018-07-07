require 'rails_helper'

describe BookingsController do
  describe 'GET index' do
    it 'assigns bookings' do
      # bookings = [{ key: :value }]
      # collection_of_bookings = double(:collection_of_bookings, where: bookings)
      # allow(Booking).to receive(:where).and_return(collection_of_bookings)

      list_serializer = double(:list_serializer, to_hash_conversion: { key: :value })
      allow(Bookings::ListSerializer).to receive(:new).and_return(list_serializer)

      get :index, format: :json, params: { restaurant_id: 1 }

      expect(response).to have_http_status(200)
      expect(response.body).to eq({ key: :value }.to_json)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates booking and renders status 201' do
        customer   = create(:customer)
        restaurant = create(:restaurant)

        params = {
          restaurant_id: restaurant.id,
          customer_id: customer.id,
          datetime: DateTime.new(2001, 2, 3, 20, 5, 9),
          amount_of_people: 4
        }
        expect { post :create, params: params }.to change { Booking.count }.by(1)
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid attributes' do
      it 'renders json error' do
        customer   = create(:customer)
        restaurant = create(:restaurant)

        params = {
          restaurant_id: restaurant.id,
          customer_id: customer.id,
          datetime: nil,
          amount_of_people: 4
        }

        expect { post :create, params: params }.to change { Booking.count }.by(0)
        expect(response).to have_http_status(422)
        datetime_errors = [
          "can't be blank",
          "Can't create a booking, if datetime is out of 6 PM - 9 PM time window"
        ]
        expect(response.body).to eq({ errors: { datetime: datetime_errors } }.to_json)
      end
    end
  end
end
