# == Schema Information
#
# Table name: clinic_category_relations
#
#  id          :integer          not null, primary key
#  category_id :integer
#  clinic_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  clinic_category_id_index  (category_id)
#  clinic_clinic_id_index    (clinic_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clinic_category_relation do
    category_id 1
    clinic_id 1
  end
end
