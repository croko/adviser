# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    name Faker::Name.first_name
    last_name Faker::Name.last_name
    email  Faker::Internet.email
    password '123456789'
    password_confirmation '123456789'
    role
  end
end
