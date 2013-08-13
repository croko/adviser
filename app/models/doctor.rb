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
#  published            :boolean
#  comments_count       :integer
#  rating               :float
#  likes_count          :integer
#  education            :string(255)
#  starting_work        :date
#  high_school_finished :date
#  high_school_name     :string(255)
#  awards               :string(255)
#  visit_home           :string(255)
#  price                :decimal(8, 2)
#  specialty            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Doctor < ActiveRecord::Base
  include ClinicSearch
  GENDER = %w(муж. жен.)

  has_many :doctor_category_relations, dependent: :destroy
  has_many :categories, through: :doctor_category_relations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, -> { order "created_at DESC" }, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :photos, :as => :attachable

  belongs_to :manager, :class_name => "Manager", :foreign_key => "user_id"

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :doctor_category_relations, :reject_if => lambda { |a| a[:category_id].nil? }, allow_destroy: true
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates :doctor_category_relations, :addresses, :last_name, presence: true

  make_permalink :full_name

  scope :rated, -> { order('rating DESC, likes_count DESC') }
  scope :my_doctors, -> (user) { where(user_id: user) }
  #scope :all_items, -> (gr) { includes(:clinic_category_relations).where('clinic_category_relations.category_id = ?', gr).references(:clinic_category_relations) }

  after_save :update_category_cache

  after_touch() { tire.update_index }

  def to_param
    permalink
  end

  def full_name
    (last_name.to_s + ' ' + first_name.to_s).strip
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

  def title_info
    full_name + ', специализация ' + specialty + ', '+ addresses.first.city
  end

  def coordinates
    addresses.collect(&:lat_lon).flatten
  end

  protected

  def update_category_cache
    categories.each { |c| c.touch }
  end
end
