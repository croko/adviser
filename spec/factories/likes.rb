# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  likeable_type :string(255)
#  likeable_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    user_id 1
    likeable_type "MyString"
    likeable_id 1
  end
end
