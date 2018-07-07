class TimeReservationValidator < ActiveModel::Validator
  def validate(record)
    datetime = record.datetime
    if !is_valid?(datetime)
      record.errors.add(
        :datetime,
        "Can't create a booking, if datetime is out of 6 PM - 9 PM time window"
      )
    end
  end

  private

  def is_valid?(datetime)
    return false if datetime.blank?
    time = datetime.strftime("%H:%M")
    time.between?('18:00', '21:00')
  end
end
