# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  pediatric     :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#  clinics_count :integer          default(0)
#  doctors_count :integer          default(0)
#

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
