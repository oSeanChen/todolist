FactoryBot.define do
  factory :category do
    title { Faker::Lorem.characters(number: 10) }

    # validation
    trait :title_nil do
      title { nil }
    end
    trait :title_over_50 do
      title { Faker::Lorem.characters(number: 51) }
    end
  end
end
