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

  has_many :comments

  validates :email, uniqueness: true
  #validates_acceptance_of :terms_of_service, on: :create
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :vkontakte, :twitter]

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    unless user
      user = User.create(last_name: access_token.extra.raw_info.last_name,
                         first_name: access_token.extra.raw_info.first_name,
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: access_token.info.email,
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(first_name: data["first_name"],
                         last_name: data["last_name"],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: data["email"],
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def self.find_for_vkontakte(access_token, signed_in_resource=nil)
    data = access_token.info
    email = access_token.extra.raw_info['screen_name'].to_s + '@vk.com'
    user = User.where(provider: access_token.provider, uid: access_token.uid).first

    unless user
      user = User.create(first_name: data["first_name"],
                         last_name: data["last_name"],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: email,
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def self.find_for_twitter(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first

    unless user
      email = access_token.uid.to_s + '@twitter.com'
      first_name = data["name"].split[0]
      last_name = data["name"].split[1]

      user = User.create(first_name: first_name,
                         last_name: last_name,
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: email,
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
