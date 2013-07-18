# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
    pediatric false
  end

  factory :invalid_category, parent: :category do
    name ''
  end
end
