require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'has a valid factory' do
    customer = build(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without first_name' do
    customer = build(:customer, first_name: nil)
    expect(customer).to be_invalid
  end

  it 'is invalid without customer_id' do
    customer = build(:customer, last_name: nil)
    expect(customer).to be_invalid
  end

  it 'is invalid without phone_number' do
    customer = build(:customer, phone_number: nil)
    expect(customer).to be_invalid
  end

  it 'is invalid without email' do
    customer = build(:customer, email: nil)
    expect(customer).to be_invalid
  end

  it 'has valid email with upper case letters and numbers' do
    customer = build(:customer, email: 'ADAM90.basebaLL78@example.com')
    expect(customer).to be_valid
  end

  it 'has invalid phone_number without plus sign' do
    customer = build(:customer, phone_number: '48980271987')
    expect(customer).to be_invalid
  end

  it 'has invalid phone_number when phone_number has more or less than 11 digits' do
    customer = build(:customer, phone_number: '+3921010239848980271987',)
    expect(customer).to be_invalid
  end
end
