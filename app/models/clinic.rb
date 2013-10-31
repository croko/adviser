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
#

class Clinic < ActiveRecord::Base
  include ClinicSearch

  has_many :clinic_category_relations, dependent: :destroy
  has_many :categories, through: :clinic_category_relations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, -> { order "created_at DESC" }, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :photos, :as => :attachable
  has_many :ads
  has_many :doctors

  belongs_to :manager, :class_name => "User", :foreign_key => "user_id"
  belongs_to :advise

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :clinic_category_relations, :reject_if => lambda { |a| a[:category_id].nil? }, allow_destroy: true
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates :clinic_category_relations, :addresses, :full_name, presence: true

  make_permalink :full_name

  scope :rated, -> { order('rating DESC, likes_count DESC') }
  scope :my_clinics, -> (user) { where(user_id: user) }
  scope :published, -> {where(published: true)}
  scope :sorted, -> { order('full_name') }
  scope :stat, -> (day) { where("date_trunc('day', created_at) = ?", day)}
  scope :stat_interval, -> (start_date, end_date) { where("created_at between ? and ?", start_date, end_date.end_of_day) }

#TODO filter published for search
  after_create :process_advise, if: :advise_id
  after_save :update_category_cache
  after_update :process_advise_iclinic, if: :advise_id

  after_touch() { tire.update_index }

  def to_param
    permalink
  end

  def liked_by_user?(user)
    user.nil? ? true : likes.where(user_id: user.id).present?
  end

  def update_rating
    ratings = comments.where('rating > 0').pluck(:rating)
    update_attribute :rating, (ratings.inject(&:+).to_f / ratings.size) unless ratings.empty?
  end

  def can_user_comment?(user)
    !comments.where(user_id: user).present?
  end

  def coordinates
    addresses.collect(&:lat_lon).flatten
  end

  def photourl
    if photos.size == 0
      '/images/default_female.jpg'
    else
      photos.try(:first).url(:thumb)
    end
  end

  protected

  def update_category_cache
    categories.each { |c| c.touch }
  end

  def process_advise
    advise.update_attribute('processed', true) unless advise.iclinic?
  end

  def process_advise_iclinic
    advise.update_attribute('processed', true) if published_changed?
  end

end
