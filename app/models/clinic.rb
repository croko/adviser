# == Schema Information
#
# Table name: clinics
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  status        :string(255)
#  user_id       :integer
#  published     :boolean          default(TRUE)
#  reviews_count :integer
#  rating        :float
#  likes_count   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Clinic < ActiveRecord::Base
  has_many :clinic_category_relations, dependent: :destroy
  has_many :categories, through: :clinic_category_relations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :manager, :class_name => "Manager", :foreign_key => "user_id"

  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :categories, :addresses, presence: true

  make_permalink :name

  def to_param
    permalink
  end

  def update_rating
    ratings = comments.where('rating > 0').pluck(:rating)
    update_attribute :rating, (ratings.inject(&:+).to_f / ratings.size) unless ratings.empty?
  end

end
