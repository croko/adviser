# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  attachable_id      :integer
#  attachable_type    :string(255)
#  published          :boolean
#  sort_order         :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Photo < ActiveRecord::Base
  has_attached_file :image, styles: {:thumb => "200x200>", :medium => "800x800>"},
                    default_url: "/images/default_male.jpg"

  belongs_to :attachable, polymorphic: true, counter_cache: true
  validates_attachment_size :image, less_than: 5.megabytes
  #validates :sort_order, :presence => true

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/gif image/png)

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
