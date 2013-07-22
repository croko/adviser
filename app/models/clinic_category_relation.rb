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
  belongs_to :doctor, class_name: 'Doctor', foreign_key: :clinic_id

  after_create :increase_counter
  after_destroy :decrease_counter

  protected

  def increase_counter
    clinic.type == 'Clinic' ? category.increment!(:clinics_count) : category.increment!(:doctors_count)
  end

  def decrease_counter
    clinic.type == 'Clinic' ? category.deccrement!(:clinics_count) : category.decrement!(:doctors_count)
  end

end
