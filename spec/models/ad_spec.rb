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
# Indexes
#
#  ads_date_end_index        (date_end)
#  ads_date_start_index      (date_start)
#  index_ads_on_category_id  (category_id)
#  index_ads_on_clinic_id    (clinic_id)
#  index_ads_on_doctor_id    (doctor_id)
#  index_ads_on_page_id      (page_id)
#

require 'spec_helper'

describe Ad do
  pending "add some examples to (or delete) #{__FILE__}"
end
