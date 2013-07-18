# == Schema Information
#
# Table name: users
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
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  likes_count            :integer          default(0)
#  comments_count         :integer          default(0)
#  created_at             :datetime
#  updated_at             :datetime
#  category_id            :integer
#  rating                 :float
#  published              :boolean          default(TRUE)
#  status                 :string(255)
#  description            :text
#  type                   :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  first_name             :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  belongs_to :category
  has_many :comments

  validates :email, uniqueness: true
  #validates_acceptance_of :terms_of_service, on: :create
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(last_name: auth.extra.raw_info.last_name,
                         first_name: auth.extra.raw_info.first_name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
