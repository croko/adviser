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
  has_many :doctor_category_relations, dependent: :destroy
  has_many :doctors, through: :doctor_category_relations
  has_many :clinics, through: :clinic_category_relations

  validates :name, presence: true
  validates :name, uniqueness: true

  make_permalink :name

  scope :sorted, -> { order('name') }

  def to_param
    permalink
  end

  def name_and_items_count
    (name + "  " + '<span class="badge badge-warning pull-right">' + (clinics_count + doctors_count).to_s + "</span>").html_safe
  end
end
