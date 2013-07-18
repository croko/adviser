# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence(:email) { |i| "mail#{i}@mail#{i}.com" }
    password '123456789'
    password_confirmation '123456789'
  end
end
