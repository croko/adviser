# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nickname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Role do
  it 'should create without errors' do
     FactoryGirl.create(:role).should be_true
  end

  it 'should have name and nick' do
    expect { FactoryGirl.create(:invalid_role)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
