# == Schema Information
#
# Table name: ads
#
#  id                 :integer          not null, primary key
#  page_id            :integer
#  name               :string(255)
#  category_id        :integer
#  doctor_id          :integer
#  clinic_id          :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  published          :boolean          default(FALSE)
#  sort_order         :integer          default(0)
#  date_start         :datetime
#  date_end           :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  baseurl            :string(255)
#

require 'spec_helper'

describe Ad do
  pending "add some examples to (or delete) #{__FILE__}"
end
