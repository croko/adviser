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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "MyString"
    description "MyString"
    image_file_name "MyString"
    image_content_type "MyString"
    image_file_size 1
    attachable_id 1
    attachable_type "MyString"
    published false
    sort_order 1
  end
end
