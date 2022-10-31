FactoryBot.define do
  factory :task do
    title { "MyString" }
    content { "MyString" }
    state { "MyString" }
    position { 1 }
    category { nil }
  end
end
