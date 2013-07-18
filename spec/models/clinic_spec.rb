# == Schema Information
#
# Table name: clinics
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  status         :string(255)
#  user_id        :integer
#  published      :boolean          default(TRUE)
#  comments_count :integer
#  rating         :float
#  likes_count    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  full_name      :string(255)
#  last_name      :string(255)
#  type           :string(255)
#

require 'spec_helper'

describe Clinic do
  it 'should create without errors' do
    FactoryGirl.create(:clinic).should be_true
  end

  it 'should belongs to a category' do
    expect { FactoryGirl.create(:clinic_without_category) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have address' do
    expect { FactoryGirl.create(:clinic_without_address) }.to raise_error(ActiveRecord::RecordInvalid)
  end

end
