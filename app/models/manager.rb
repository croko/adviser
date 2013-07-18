# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  type                   :string(255)
#  likes_count            :integer          default(0)
#  reviews_count          :integer          default(0)
#  created_at             :datetime
#  updated_at             :datetime
#  category_id            :integer
#  rating                 :float
#  published              :boolean          default(TRUE)
#  status                 :string(255)
#  description            :text
#

class Manager < User

  validates :name, :last_name, presence: true

end
