# == Schema Information
#
# Table name: clinics
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text
#  status               :string(255)
#  user_id              :integer
#  published            :boolean          default(TRUE)
#  comments_count       :integer
#  rating               :float
#  likes_count          :integer
#  created_at           :datetime
#  updated_at           :datetime
#  full_name            :string(255)
#  last_name            :string(255)
#  type                 :string(255)
#  education            :string(255)
#  starting_work        :date
#  high_school_name     :string(255)
#  high_school_finished :date
#  awards               :string(255)
#  visit_home           :boolean
#  price                :decimal(8, 2)    default(0.0)
#  specialty            :string(255)
#

class Clinic < ActiveRecord::Base
  has_many :clinic_category_relations, dependent: :destroy
  has_many :categories, through: :clinic_category_relations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :photos, :as => :attachable

  belongs_to :manager, :class_name => "Manager", :foreign_key => "user_id"

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :clinic_category_relations, :reject_if => lambda { |a| a[:category_id].nil? }, allow_destroy: true
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates :clinic_category_relations, :addresses, :full_name, presence: true

  make_permalink :full_name

  scope :rated, -> { order('rating DESC, likes_count DESC') }
  scope :all_items, -> (gr) { includes(:clinic_category_relations).where('clinic_category_relations.category_id = ?', gr).references(:clinic_category_relations) }

  after_save :update_category_cache

  def to_param
    permalink
  end

  def liked_by_user?(user)
    user.nil? ? true : likes.where(user_id: user.id).present?
  end

  protected

  def update_rating
    ratings = comments.where('rating > 0').pluck(:rating)
    update_attribute :rating, (ratings.inject(&:+).to_f / ratings.size) unless ratings.empty?
  end

  def update_category_cache
    categories.each { |c| c.touch }
  end
end
