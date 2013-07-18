# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  message          :text
#  rating           :integer          default(0)
#  commentable_type :string(255)
#  commentable_id   :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
