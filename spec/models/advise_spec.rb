# == Schema Information
#
# Table name: advises
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  category_id  :integer
#  last_name    :string(255)
#  name         :string(255)
#  full_name    :string(255)
#  specialty    :string(255)
#  city         :string(255)
#  phone_number :string(255)
#  description  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  pediatric    :boolean          default(FALSE)
#  processed    :boolean          default(FALSE)
#  email_sent   :boolean          default(FALSE)
#

require 'spec_helper'

describe Advise do

  it 'shoud create doctor if idoctor checked' do
    @advise = FactoryGirl.create(:advise_idoctor)
    expect(@advise.doctor.present?).to be_true
  end

  it 'shoud create clinic if iclinic checked' do
    @advise = FactoryGirl.create(:advise_iclinic)
    expect(@advise.clinic.present?).to be_true
  end
end
