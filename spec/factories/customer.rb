FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number  { "+#{ 11.times.map { rand(9)}.join }" }
    email { Faker::Internet.safe_email }
  end
end
