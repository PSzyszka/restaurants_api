require 'rails_helper'

describe RestaurantsController do
  describe 'GET index' do
    it 'assigns restaurants' do
      list_serializer = double(:list_serializer, to_hash_conversion: { key: :value })
      allow(Restaurants::ListSerializer).to receive(:new).and_return(list_serializer)

      get :index, format: :json

      expect(response).to have_http_status(200)
      expect(response.body).to eq({ key: :value }.to_json)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'assigns restaurant and renders status 201' do
        params = { name: 'Best Pizza', localization: 'Best street' }
        expect { post :create, params: params }.to change { Restaurant.count }.by(1)
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid attributes' do
      it 'renders json error' do
        params = { name: '', localization: '21 Street London' }

        expect { post :create, params: params }.to change { Restaurant.count }.by(0)
        expect(response).to have_http_status(422)
        expect(response.body).to eq({ errors: { name: ["can't be blank"] } }.to_json)
      end
    end
  end
end
