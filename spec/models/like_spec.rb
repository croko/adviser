# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  likeable_type :string(255)
#  likeable_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Like do
  pending "add some examples to (or delete) #{__FILE__}"
end
