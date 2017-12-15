FactoryBot.define do
  factory :park do
    title { Faker::TwinPeaks.location }
    description { Faker::Hipster.paragraph }
    address { Faker::Address.street_address }
    bathroom { Faker::Boolean.boolean }

    drinking_fountain { Faker::Boolean.boolean }
    dog_park { Faker::Boolean.boolean }
    playground { Faker::Boolean.boolean }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

  end
end
