# == Schema Information
#
# Table name: ads
#
#  id                 :integer          not null, primary key
#  page_id            :integer
#  name               :string(255)
#  category_id        :integer
#  doctor_id          :integer
#  clinic_id          :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  published          :boolean          default(FALSE)
#  sort_order         :integer          default(0)
#  date_start         :datetime
#  date_end           :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Ad < ActiveRecord::Base
  belongs_to :page
  belongs_to :category
  belongs_to :doctor
  belongs_to :clinic

  has_attached_file :image, styles: {:square => "250x250>", :half_page => "300x600>"}
  validates_attachment_size :image, less_than: 5.megabytes
  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/gif image/png)

  scope :nick, -> (name) { where(name: name) }
  scope :active, -> () { where('now() between date_start and date_end') }

  def url(*args)
    image.url(*args)
  end

  def path(*args)
    image.path(*args)
  end

  def name
    image_file_name
  end

  def content_type
    image_content_type
  end

  def file_size
    image_file_size
  end

end
