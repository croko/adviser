# == Schema Information
#
# Table name: doctor_category_relations
#
#  id          :integer          not null, primary key
#  doctor_id   :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_doctor_category_relations_on_category_id  (category_id)
#  index_doctor_category_relations_on_doctor_id    (doctor_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor_category_relation do
    doctor nil
    category nil
  end
end
