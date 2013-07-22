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

class Doctor < Clinic

  has_many :likes, as: :likeable, source_type: 'Clinic', dependent: :destroy

  validates :name, :last_name, presence: true

  def full_name
    last_name.to_s + ' ' + name.to_s
  end


end
