class CustomerMessageWorker
  include Sidekiq::Worker
  def perform
    emails = Customer.joins(:bookings)
                     .where('bookings.datetime::date = ?', Date.yesterday)
                     .map { |customer| customer.email }
                     .uniq

    emails.each do |email|
      CustomerMailer.see_you_next_time_email(email).deliver
    end
  end
end
