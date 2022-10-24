FactoryBot.define do
  factory :category do
    title { Faker::Hobby.activity }

    #validation
    trait :title_nil do
      title { nil }
    end
    
  end
end
