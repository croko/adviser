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
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_admin_users_on_unlock_token          (unlock_token) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    name Faker::Name.first_name
    last_name Faker::Name.last_name
    email  Faker::Internet.email
    password '123456789'
    password_confirmation '123456789'
    role
  end
end
