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

class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, :rememberable
  #:registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  validates :email, uniqueness: true
  validates :name, :last_name, :role, presence: true

  def role?(nick)
    try(:role).try(:nickname) == nick
  end

  protected
  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
