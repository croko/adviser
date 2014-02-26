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
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  pediatric    :boolean          default(FALSE)
#  processed    :boolean          default(FALSE)
#  email_sent   :boolean          default(FALSE)
#  idoctor      :boolean          default(FALSE)
#  iclinic      :boolean          default(FALSE)
#  comment      :text
#  rating       :integer          default(0)
#

class Advise < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_one :doctor
  has_one :clinic

  validates :last_name, presence: true, if: -> { full_name.blank? }
  validates :name, presence: true, if: -> { full_name.blank? }
  validates :full_name, presence: true, if: -> { name.blank? && last_name.blank? }
  validates :city, :phone_number, :category_id, presence: true

  attr_accessor :choice
  after_create :sendmail, :process_advise

  scope :sorted, -> { order('created_at DESC') }
  scope :unprocessed, -> { where(processed: false) }
  scope :stat, -> (day) { where("date_trunc('day', created_at) = ?", day)}
  scope :stat_interval, -> (start_date, end_date) { where("created_at between ? and ?", start_date, end_date.end_of_day) }

  def sendmail
    Mailer.new_advise(self).deliver
  end

  def process_advise
    if idoctor?
      doc = self.build_doctor(
          last_name: last_name,
          first_name: name,
          specialty: specialty,
          description: description,
          pediatric: pediatric,
          user_id: user_id,
          published: false
      )
      doc.categories << Category.find(category_id)
      doc.addresses.build(
          city: city,
          phone_number: phone_number)
      doc.save
    end

    if iclinic?
      cli = self.build_clinic(
          full_name: full_name,
          specialty: specialty,
          description: description,
          pediatric: pediatric,
          user_id: user_id,
          published: false
      )
      cli.categories << Category.find(category_id)
      cli.addresses.build(
          city: city,
          phone_number: phone_number)
      cli.save
    end
  end
end
