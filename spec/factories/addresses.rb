# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    phone_number "123123123"
    mobile_phone_number "123123123"
    address_1 Faker::Address.street_name
    address_2 "MyString"
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
  end

  factory :address_new_york, parent: :address do
    city 'New York'
  end

  factory :address_los_angeles, parent: :address do
    city 'Los Angeles'
  end

end