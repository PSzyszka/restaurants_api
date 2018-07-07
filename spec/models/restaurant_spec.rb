require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it 'has a valid factory' do
    restaurant = built(:restaurant)
    expect(restaurant).to be_valid
  end

  it 'is invalid without name' do
    restaurant = built(:restaurant, name: nil)
    expect(restaurant).to be_invalid
  end

  it 'is invalid without localization' do
    restaurant = built(:restaurant, localization: nil)
    expect(restaurant).to be_invalid
  end
end
