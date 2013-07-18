# == Schema Information
#
# Table name: addresses
#
#  id                  :integer          not null, primary key
#  phone_number        :string(255)
#  mobile_phone_number :string(255)
#  address_1           :string(255)
#  address_2           :string(255)
#  city                :string(255)
#  state               :string(255)
#  zip_code            :string(255)
#  addressable_id      :integer
#  addressable_type    :string(255)
#  latitude            :float
#  longitude           :float
#  created_at          :datetime
#  updated_at          :datetime
#  website_url         :string(255)
#

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
