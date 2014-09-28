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
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :clinics
  has_many :doctors

  validates :first_name, presence: true
  validates :email, uniqueness: true
  #validates_acceptance_of :terms_of_service, on: :create
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :vkontakte, :twitter]

  scope :sorted, -> { order('last_name, first_name') }
  scope :stat, -> (day) { where("date_trunc('day', created_at) = ?", day)}
  scope :stat_interval, -> (start_date, end_date) { where("created_at between ? and ?", start_date, end_date) }

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
      email = access_token.info.email.present? ? access_token.info.email : access_token.uid.to_s + '@facebook.com'
      user = User.create(last_name: access_token.extra.raw_info.last_name,
                          first_name: access_token.extra.raw_info.first_name,
                          provider: access_token.provider,
                          uid: access_token.uid,
                          email: email,
                          password: Devise.friendly_token[0, 20],
                          social_url: access_token.extra.raw_info.link,
                          picture_url: access_token.info.image,
                          gender: access_token.extra.raw_info.gender,
                          locale: access_token.extra.raw_info.locale,
                          token: access_token.credentials.token.to_s

      )
      # user.post_facebook(user)
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
                         birthday: access_token.extra.raw_info.birthday,
                         token: access_token.credentials.token.to_s
      )
    end
    user
  end

  def self.find_for_vkontakte(access_token, code, signed_in_resource=nil)
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
                         birthday: access_token.extra.raw_info.bdate,
                         token: access_token.credentials.token.to_s

      )
      # user.post_vk(user)
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

      user = User.create!(first_name: first_name,
                         last_name: last_name,
                         provider: access_token.provider,
                         uid: access_token.uid,
                         email: email,
                         password: Devise.friendly_token[0, 20],
                         social_url: data.urls['Twitter'],
                         picture_url: data.image,
                         locale: access_token.extra.raw_info.lang,
                         location: access_token.extra.raw_info.location,
                         birthday: access_token.extra.raw_info.bdate,
                         secret: access_token.credentials.secret.to_s,
                         token: access_token.credentials.token.to_s

      )
      user.post_twitter(user)
    end
    user
  end

  def sendmail
    Mailer.new_user(self).deliver
  end

  def post_facebook(user)
    begin
      FbGraph::User.me(user.token).feed!(
        message: user.post_message[:title],
        link: user.post_message[:url],
        description: user.post_message[:about],
        picture: user.post_message[:image]
        )
    rescue => ex
      Rails.logger.error "post_facebook #{ex}"
    end
  end

  def post_twitter(user)
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key=SOCIALS_CONFIG['twitter']['key']
        config.consumer_secret = SOCIALS_CONFIG['twitter']['secret']
        config.access_token = user.token
        config.access_token_secret = user.secret
      end
      client.update("#{user.post_message[:title]} #{user.post_message[:url]}")
    rescue => ex
      Rails.logger.error "post_twitter #{ex}"
    end
  end

#   def post_vk(user)
#     begin
#     message= "База врачей и клиник Украины и отзывы о них. Здесь можно найти или рекомендовать хорошего специалиста! http://consultor.com.ua"
#     vk_api_url = 'https://api.vk.com/method/'

#       # album_name = 'Мой вишлист'

#       methods = {get_albums: 'photos.getAlbums', create_album: 'photos.createAlbum',
#                  wall_post: 'wall.post', get_upload_server: 'photos.getUploadServer',
#                  photos_save: 'photos.save'}

#       # create_album_params = {title: album_name, user_id: user.uid, access_token: user.token}
#         # album = call_vk_api(create_album_params, methods[:create_album], vk_api_url)
#       # album = albums.select { |v| v['title'] == 'Мой вишлист' }.first

#     message_params = {message: message, owner_id: user.uid, access_token: user.token}
#     response = user.call_vk_api(message_params, methods[:wall_post], vk_api_url)
#     rescue => ex
#       binding.pry
#       Rails.logger.error "post_vk #{ex}"
#     end
#   end

  # def call_vk_api(params, method, vk_api_url)
  #   JSON.parse(Net::HTTP.post_form(URI.parse(vk_api_url + method), params).body)['response']
  # end

  def post_message
    {
      url: 'http://consultor.com.ua',
      title: "База врачей и клиник Украины и отзывы о них",
      about: "Здесь можно найти или рекомендовать хорошего специалиста!",
      image: 'http://consultor.com.ua/images/logosq.png'
    }
  end

  protected
  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
