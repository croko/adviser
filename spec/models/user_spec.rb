# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  status                 :string(255)
#  description            :text
#  type                   :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  first_name             :string(255)
#

require 'spec_helper'

describe User do
  it 'should create without errors' do
    FactoryGirl.create(:user).should be_true
  end
end
