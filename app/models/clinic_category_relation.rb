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

class ClinicCategoryRelation < ActiveRecord::Base
  belongs_to :category
  belongs_to :clinic
end
