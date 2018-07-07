require 'faker'

customers = [
  {
    first_name: 'Henry',
    last_name: 'Specture',
    phone_number: '+48098123645',
    email: 'henry.specture@exaple.com'
  },
  {
    first_name: 'Kevin',
    last_name: 'Levine',
    phone_number: '+48787162945',
    email: 'Kevin15@exaple.com'
  },
  {
    first_name: 'Jim',
    last_name: 'Pit',
    phone_number: '+48098765423',
    email: 'JIM.PIT1990@exaple.com'
  },
  {
    first_name: 'Jennifer',
    last_name: 'Lopez',
    phone_number: '+48629164826',
    email: 'jenniferlopez@exaple.com'
  },
  {
    first_name: 'Poul',
    last_name: 'Big',
    phone_number: '+48167291846',
    email: 'big.poul@exaple.com'
  }
]

Rails.logger = Logger.new(STDOUT)
Rails.logger.info 'Creating restaurants, bookings and customers...'

if Restaurant.count < 15
  15.times do |i|
    number = i.zero? ? '' : i + 1
    name = "Pizza shop #{number}".strip
    localization = "Street #{number}".strip
    restaurant = Restaurant.create!(
      name: name,
      localization: localization
    )
    actual_date = Date.current + i.days
    customer = customers.sample
    rand(0..4).times do
      Booking.create!(
        amount_of_people: rand(1..2),
        datetime: actual_date + rand(18..21).hours,
        restaurant: restaurant,
        customer: Customer.find_or_create_by!(
          first_name: customer[:first_name],
          last_name: customer[:last_name],
          phone_number: customer[:phone_number],
          email: customer[:email]
        )
      )
    end
  end
end
