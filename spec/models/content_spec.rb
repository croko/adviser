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

require 'spec_helper'

describe Content do
  pending "add some examples to (or delete) #{__FILE__}"
end
