# == Schema Information
#
# Table name: clinics
#
#  id             :integer          not null, primary key
#  description    :text
#  status         :string(255)
#  user_id        :integer
#  published      :boolean          default(TRUE)
#  comments_count :integer          default(0)
#  rating         :float            default(0.0)
#  likes_count    :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  full_name      :string(255)
#  starting_work  :date
#  awards         :string(255)
#  price          :decimal(8, 2)    default(0.0)
#  specialty      :string(255)
#  pediatric      :boolean          default(FALSE)
#  advise_id      :integer
#  visit_home     :boolean          default(FALSE)
#  photos_count   :integer          default(0)
#  end_promo      :date
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clinic do
    full_name Faker::Lorem.word
    description Faker::Lorem.sentence
    status "MyString"
    published false
    comments_count 1
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
