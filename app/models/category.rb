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

class Category < ActiveRecord::Base
  has_many :users
  has_many :clinic_category_relations, dependent: :destroy
  has_many :doctors, through: :clinic_category_relations #, source_type: 'Doctor'
  has_many :clinics, through: :clinic_category_relations #, source_type: 'Clinic'

  validates :name, presence: true
  validates :name, uniqueness: true

  make_permalink :name

  scope :sorted, -> { order('name') }

  def to_param
    permalink
  end

  def name_and_items_count
    name + "  (" + (clinics_count + doctors_count).to_s + ")"
  end
end
