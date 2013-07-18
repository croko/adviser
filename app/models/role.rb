# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nickname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :admin_users
  validates :name, :nickname, presence: true
  validates :name, :nickname, uniqueness: true
end
