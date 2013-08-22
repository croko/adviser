# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nickname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base

  has_many :contents

  validates :name, :nickname, presence: true

  scope :nick, -> (name) { where(nickname: name).first }

end
