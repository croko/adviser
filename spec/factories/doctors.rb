# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor, parent: :user, class: 'Doctor' do
   category
    after(:build) do |member|
      member.addresses << FactoryGirl.build(:address)
    end
  end

  factory :doctor_without_address, parent: :doctor do
    after(:build) do |member|
      member.addresses.delete_all
    end
  end
end
