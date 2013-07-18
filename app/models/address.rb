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
#  email               :string(255)
#

class Address < ActiveRecord::Base

  belongs_to :addressable, polymorphic: true

  validates_presence_of :address_1, :city, :state, :zip_code

  def street_address
    "#{address_1}, #{address_2}"
  end

  def city_address
    "#{city}, #{state}, #{zip_code}"
  end

  def website_base_url
    uri = URI.parse website_url
    uri.scheme = 'http' if uri.scheme.nil?
    base_uri = URI::Generic::new uri.scheme, nil, uri.host, nil, nil, nil, nil, nil, nil
    base_uri.to_s
  end

end
