FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    sequence(:password) { |n| "Aa#{n}aaaaaaa" }
  end
end
