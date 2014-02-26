# == Schema Information
#
# Table name: addresses
#
#  id                  :integer          not null, primary key
#  phone_number        :string(255)
#  mobile_phone_number :string(255)
#  address_1           :string(255)
#  address_2           :string(255)
#  city                :string(255)
#  state               :string(255)
#  zip_code            :string(255)
#  addressable_id      :integer
#  addressable_type    :string(255)
#  latitude            :float
#  longitude           :float
#  created_at          :datetime
#  updated_at          :datetime
#  website_url         :string(255)
#  email               :string(255)
#  district            :string(255)
#

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
    email Faker::Internet.email
    website_url Faker::Internet.url
  end

  factory :address_new_york, parent: :address do
    city 'New York'
  end

  factory :address_los_angeles, parent: :address do
    city 'Los Angeles'
  end

end
