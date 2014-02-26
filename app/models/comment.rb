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
#  published        :boolean          default(TRUE)
#  name             :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user

  validates_presence_of :message
  validates :user_id, :uniqueness => {:scope => [:commentable_type, :commentable_id]}
  validates :name, presence: true, if: Proc.new { |u| u.user_id.nil?}

  before_save :set_name, :set_commentable
  after_save :update_rating
  after_destroy :update_rating

  attr_accessor :doctor_id
  attr_accessor :clinic_id

  def update_rating
    commentable.update_rating
  end

  def doctor_last_name
    commentable.last_name if commentable_type == 'Doctor'
  end

  def clinic_full_name
    commentable.full_name if commentable_type == 'Clinic'
  end

  def set_name
    self.name = user.first_name if name.blank?
  end

  def set_commentable
    if doctor_id.present?
      self.commentable = Doctor.find(doctor_id)
    end
    if clinic_id.present?
      self.commentable = Clinic.find(clinic_id)
    end
  end

end
