# == Schema Information
#
# Table name: clinics
#
#  id             :integer          not null, primary key
#  description    :text
#  status         :string(255)
#  user_id        :integer
#  published      :boolean          default(TRUE)
#  comments_count :integer          default(0)
#  rating         :float            default(0.0)
#  likes_count    :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  full_name      :string(255)
#  starting_work  :date
#  awards         :string(255)
#  price          :decimal(8, 2)    default(0.0)
#  specialty      :string(255)
#  pediatric      :boolean          default(FALSE)
#  advise_id      :integer
#  visit_home     :boolean          default(FALSE)
#  photos_count   :integer          default(0)
#  end_promo      :date
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
