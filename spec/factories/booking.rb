FactoryBot.define do
  factory :booking do
    amount_of_people 1
    datetime { Date.current + 19.hours }
    customer
    restaurant
  end
end
