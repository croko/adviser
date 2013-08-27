# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advise do
    user
    category
    name Faker::Name.name
    last_name Faker::Name.last_name
    phone_number "123123123"
    city Faker::Address.city
  end

  factory :advise_idoctor, parent: :advise do
    idoctor true
  end

  factory :advise_iclinic, parent: :advise do
    full_name Faker::Lorem::word
    iclinic true
  end

end