# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  announce   :string(255)
#  body       :text
#  page_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Content < ActiveRecord::Base
  belongs_to :page

  scope :nick, -> (name) { where(name: name).first }

end
