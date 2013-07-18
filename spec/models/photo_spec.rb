# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  attachable_id      :integer
#  attachable_type    :string(255)
#  published          :boolean
#  sort_order         :integer
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Photo do
  pending "add some examples to (or delete) #{__FILE__}"
end
