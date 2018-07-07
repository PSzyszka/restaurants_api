FactoryBot.define do
  factory :restaurant do
    name { "#{Faker::Name.first_name}'s Pizza" }
    localization { Faker::Address.full_address }
  end
end
