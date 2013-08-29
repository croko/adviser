# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do
    page nil
    name "MyString"
    category nil
    doctor nil
    clinic nil
    image_file_name "MyString"
    image_content_type "MyString"
    image_file_size 1
    published false
    sort_order 1
    date_start "08-28-2013 07:37:22"
    date_end "08-28-2013 07:37:22"
  end
end
