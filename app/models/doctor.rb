# == Schema Information
#
# Table name: clinics
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  status         :string(255)
#  user_id        :integer
#  published      :boolean          default(TRUE)
#  comments_count :integer
#  rating         :float
#  likes_count    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  full_name      :string(255)
#  last_name      :string(255)
#  type           :string(255)
#

class Doctor < Clinic
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :name, :last_name, :addresses, presence: true

  def full_name
    last_name.to_s + ' ' + name.to_s
  end

end
