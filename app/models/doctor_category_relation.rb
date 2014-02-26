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

class DoctorCategoryRelation < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :category

  after_create :increase_counter
  after_destroy :decrease_counter

  protected

  def increase_counter
    category.increment!(:doctors_count)
  end

  def decrease_counter
    category.decrement!(:doctors_count)
  end
end
