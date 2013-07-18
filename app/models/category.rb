# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  pediatric  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :users
  has_many :clinic_category_relations, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
