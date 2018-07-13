require 'rails_helper'

describe CustomerMessageWorker do
  it 'sends messages when emails are present' do
    customer1 = create(:customer, email: 'adam.lucky@example.com')
    customer2 = create(:customer, email: 'dorota.magda@example.com')
    restaurant = create(:restaurant)
    create(
      :booking,
      restaurant: restaurant,
      customer: customer1,
      datetime: DateTime.new(2018, 7, 12, 19, 0, 0)
    )

    create(
      :booking,
      restaurant: restaurant,
      customer: customer2,
      datetime: DateTime.new(2018, 7, 12, 19, 0, 0)
    )

    new_time = Time.local(2018, 7, 13, 10, 0, 0)
    Timecop.freeze(new_time)
    expect(CustomerMailer).to receive(:see_you_next_time_email)
                          .and_call_original
                          .with('adam.lucky@example.com')
    expect(CustomerMailer).to receive(:see_you_next_time_email)
                          .and_call_original
                          .with('dorota.magda@example.com')
    CustomerMessageWorker.new.perform
  end

  it 'sends one message when two equal emails are present' do
    customer = create(:customer, email: 'adam.lucky@example.com')
    restaurant = create(:restaurant)
    create_list(
      :booking, 2,
      restaurant: restaurant,
      customer: customer,
      datetime: DateTime.new(2018, 7, 12, 19, 0, 0)
    )

    new_time = Time.local(2018, 7, 13, 10, 0, 0)
    Timecop.freeze(new_time)
    expect(CustomerMailer).to receive(:see_you_next_time_email)
                          .and_call_original
                          .with('adam.lucky@example.com')
    CustomerMessageWorker.new.perform
  end

  it 'sends one message when two equal emails are present' do
    restaurant = create(:restaurant)

    expect(CustomerMailer).to_not receive(:see_you_next_time_email)
    CustomerMessageWorker.new.perform
  end
end
