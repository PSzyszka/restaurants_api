require 'rails_helper'

describe TimeReservationValidator do
  it 'returns nil when valid' do
    record = double(:record, datetime: DateTime.new(2001, 2, 3, 19, 5, 9), errors: [])
    expect(TimeReservationValidator.new.validate(record)).to eq(nil)
  end

  it 'returns false if datetime empty and adds error' do
    errors = double(:errors, add: 'error')
    record = double(:record, datetime: nil, errors: errors)
    expect(TimeReservationValidator.new.validate(record)).to eq('error')
  end

  it 'returns false when time outside range 6 to 9 PM and adds error' do
    errors = double(:errors, add: 'error')
    record = double(:record, datetime: DateTime.new(2001, 2, 3, 22, 5, 9), errors: errors)
    expect(TimeReservationValidator.new.validate(record)).to eq('error')
  end
end
