# == Schema Information
#
# Table name: advises
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  category_id  :integer
#  last_name    :string(255)
#  name         :string(255)
#  full_name    :string(255)
#  specialty    :string(255)
#  city         :string(255)
#  phone_number :string(255)
#  description  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  pediatric    :boolean          default(FALSE)
#  processed    :boolean          default(FALSE)
#  email_sent   :boolean          default(FALSE)
#

class Advise < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_one :doctor
  has_one :clinic

  validates :last_name, presence: true, if: -> { full_name.blank? }
  validates :name, presence: true, if: -> { full_name.blank? }
  validates :full_name, presence: true, if: -> { name.blank? && last_name.blank? }
  validates :category_id, presence: true

  after_create :sendmail

  scope :sorted, -> { order('created_at DESC') }
  scope :unprocessed, -> { where(processed: false) }

  def sendmail
    Mailer.new_advise(self).deliver
  end

end
