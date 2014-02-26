# == Schema Information
#
# Table name: advises
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  category_id  :integer
#  last_name    :string(255)
#  name         :string(255)
#  full_name    :string(255)
#  specialty    :string(255)
#  city         :string(255)
#  phone_number :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  pediatric    :boolean          default(FALSE)
#  processed    :boolean          default(FALSE)
#  email_sent   :boolean          default(FALSE)
#  idoctor      :boolean          default(FALSE)
#  iclinic      :boolean          default(FALSE)
#  comment      :text
#  rating       :integer          default(0)
#

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
