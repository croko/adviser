# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clinic do
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    status "MyString"
    published false
    reviews_count 1
    rating { rand(0..5) }
    likes_count 1
    manager
    after(:build) do |member|
      member.categories << FactoryGirl.build(:category)
      member.addresses << FactoryGirl.build(:address)
    end
  end

  factory :clinic_without_address, parent: :clinic do
    after(:build) do |member|
      member.addresses.delete_all
    end
  end

  factory :clinic_without_category, parent: :clinic do
    after(:build) do |member|
      member.categories.delete_all
    end
  end

end
