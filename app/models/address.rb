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
#  district            :string(255)
#

class Address < ActiveRecord::Base

  belongs_to :addressable, polymorphic: true

  validates_presence_of :city

  after_validation :geocode_location

  geocoded_by :address_proc

  def street_address
    "#{address_1} #{address_2}"
  end

  def city_address
    addr = ''
    if zip_code.present?
      addr = zip_code + ', '
    end
    if state.present?
      addr = addr + state + ' обл., '
    end
    if city.present?
      addr += city
    end
    addr
  end

  def website_base_url
    uri = URI.parse website_url
    if uri.scheme.nil?
      uri.scheme = 'http'
      base_uri = URI::Generic::new uri.scheme, nil, website_url, nil, nil, nil, nil, nil, nil
    else
      base_uri = URI::Generic::new uri.scheme, nil, uri.host, nil, nil, nil, nil, nil, nil
    end
    base_uri.to_s
  end

  def lat_lon
    [latitude.to_f, longitude.to_f]
  end

  def geocode_location
    begin
      self.geocode
      #geocode_log.debug("#{self.id} - #{self.send(:address_proc)} - lat : #{self.latitude} - lng : #{self.longitude}")
      addressable.touch # rebuild search index
    rescue
      self.latitude = 0
      self.longitude = 0
    end
  end

  protected

  def address_proc
    [address_1, city, district, state, zip_code].compact.join(', ')
  end
end
