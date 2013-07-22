# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  message          :text
#  rating           :integer          default(0)
#  commentable_type :string(255)
#  commentable_id   :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user

  validates_presence_of :message
  validates :user_id, :uniqueness => {:scope => [:commentable_type, :commentable_id]}
  #scope :latest_programs, order(:created_at).merge(Program.published).joins('join programs ON programs.id = reviews.reviewable_id AND reviewable_type = "Program"').limit(5)

  after_save :update_rating
  after_destroy :update_rating

  def update_rating
    commentable.update_rating
  end
end
