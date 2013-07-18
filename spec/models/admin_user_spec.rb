# == Schema Information
#
# Table name: admin_users
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
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  role_id                :integer
#  name                   :string(255)
#  last_name              :string(255)
#

require 'spec_helper'

describe AdminUser do
    it 'should create without errors' do
      FactoryGirl.create(:admin_user).should be_true
    end

    it 'should have a role' do
      expect { FactoryGirl.create(:admin_user, role_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
