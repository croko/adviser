# == Schema Information
#
# Table name: doctors
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  description          :text
#  status               :string(255)
#  user_id              :integer
#  clinic_id            :integer
#  published            :boolean          default(TRUE)
#  comments_count       :integer          default(0)
#  rating               :float            default(0.0)
#  likes_count          :integer          default(0)
#  education            :string(255)
#  starting_work        :date
#  high_school_finished :date
#  high_school_name     :string(255)
#  awards               :string(255)
#  price                :decimal(8, 2)
#  specialty            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  gender               :string(255)
#  pediatric            :boolean          default(FALSE)
#  advise_id            :integer
#  visit_home           :boolean          default(FALSE)
#  photos_count         :integer          default(0)
#  employer             :string(255)
#  end_promo            :date
#
# Indexes
#
#  index_doctors_on_clinic_id  (clinic_id)
#  index_doctors_on_user_id    (user_id)
#

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
