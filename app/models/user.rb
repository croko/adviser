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
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  status                 :string(255)
#  description            :text
#  type                   :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  first_name             :string(255)
#  social_url             :string(255)
#  picture_url            :string(255)
#  gender                 :string(255)
#  birthday               :string(255)
#  locale                 :string(255)
#  location               :string(255)
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :comments
  has_many :clinics
  has_many :doctors

  validates :email, uniqueness: true
  #validates_acceptance_of :terms_of_service, on: :create
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :vkontakte, :twitter]

  after_create :sendmail

  def full_name
    (last_name.to_s + ' ' + first_name.to_s).strip
  end

  def manager?
    clinics.size + doctors.size > 0
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    if access_token.info.email.present?
      user = User.where(email: access_token.info.email).first
    else
      user = User.where(provider: access_token.provider, uid: access_token.uid.to_s).first
    end
    unless user
      user = User.create!(last_name: access_token.extra.raw_info.last_name,
                          first_name: access_token.extra.raw_info.first_name,
                          provider: access_token.provider,
                          uid: access_token.uid,
                          email: access_token.info.email,
                          password: Devise.friendly_token[0, 20],
                          social_url: access_token.extra.raw_info.link,
                          picture_url: access_token.info.image,
                          gender: access_token.extra.raw_info.gender,
                          locale: access_token.extra.raw_info.locale


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
                         password: Devise.friendly_token[0, 20],
                         social_url: access_token.extra.raw_info.link,
                         picture_url: data.image,
                         gender: access_token.extra.raw_info.gender,
                         locale: access_token.extra.raw_info.locale,
                         birthday: access_token.extra.raw_info.birthday
      )
    end
    user
  end

  def self.find_for_vkontakte(access_token, signed_in_resource=nil)
    data = access_token.info
    email = access_token.extra.raw_info['screen_name'].to_s + '@vk.com'
    user = User.where(provider: access_token.provider, uid: access_token.uid.to_s).first

    unless user
      user = User.create(first_name: data["first_name"],
                         last_name: data["last_name"],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: email,
                         password: Devise.friendly_token[0, 20],
                         social_url: data.urls['Vkontakte'],
                         picture_url: data.image,
                         gender: access_token.extra.raw_info.sex,
                         location: data.location,
                         birthday: access_token.extra.raw_info.bdate

      )
    end
    user
  end

  def self.find_for_twitter(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid.to_s).first

    unless user
      email = access_token.uid.to_s + '@twitter.com'
      first_name = data["name"].split[0]
      last_name = data["name"].split[1]

      user = User.create(first_name: first_name,
                         last_name: last_name,
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: email,
                         password: Devise.friendly_token[0, 20],
                         social_url: data.urls['Twitter'],
                         picture_url: data.image,
                         locale: access_token.extra.raw_info.lang,
                         location: access_token.extra.raw_info.location,
                         birthday: access_token.extra.raw_info.bdate

      )
    end
    user
  end

  def sendmail
    Mailer.new_user(self).deliver
  end

  protected
  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
