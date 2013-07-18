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

describe Doctor do

  it 'should create without errors' do
    FactoryGirl.create(:doctor).should be_true
  end

  it 'should belongs to a category' do
    expect { FactoryGirl.create(:doctor_without_category) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have address' do
    expect { FactoryGirl.create(:doctor_without_address) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'shoukd have updated rating after new comments' do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @doctor = FactoryGirl.create(:doctor)

    @doctor.comments.create(user_id: @user.id, message: 'some text', rating: 3)
    @doctor.comments.create(user_id: @user2.id, message: 'some text 2', rating: 5)
    expect(@doctor.reload.rating).to eq(4)
  end
end
