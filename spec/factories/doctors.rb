# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor, parent: :clinic, class: 'Doctor' do
    name Faker::Name.name
    last_name Faker::Name.last_name
    full_name nil
    after(:build) do |member|
      member.categories << FactoryGirl.build(:category)
      member.addresses << FactoryGirl.build(:address)
    end
  end

  factory :doctor_without_category, parent: :doctor do
    after(:build) do |member|
      member.categories.delete_all
    end
  end

  factory :doctor_without_address, parent: :doctor do
    after(:build) do |member|
      member.addresses.delete_all
    end
  end
end
