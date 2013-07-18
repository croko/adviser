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
