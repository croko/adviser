# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  pediatric  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Category do
  it 'should create without errors' do
    FactoryGirl.create(:category).should be_true
  end

  it 'should have name and nick' do
    expect { FactoryGirl.create(:invalid_category)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
