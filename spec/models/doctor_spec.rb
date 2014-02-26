# == Schema Information
#
# Table name: doctors
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  description          :text
#  status               :string(255)
#  user_id              :integer
#  clinic_id            :integer
#  published            :boolean          default(TRUE)
#  comments_count       :integer          default(0)
#  rating               :float            default(0.0)
#  likes_count          :integer          default(0)
#  education            :string(255)
#  starting_work        :date
#  high_school_finished :date
#  high_school_name     :string(255)
#  awards               :string(255)
#  price                :decimal(8, 2)
#  specialty            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  gender               :string(255)
#  pediatric            :boolean          default(FALSE)
#  advise_id            :integer
#  visit_home           :boolean          default(FALSE)
#  photos_count         :integer          default(0)
#  employer             :string(255)
#  end_promo            :date
#
# Indexes
#
#  index_doctors_on_clinic_id  (clinic_id)
#  index_doctors_on_user_id    (user_id)
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
