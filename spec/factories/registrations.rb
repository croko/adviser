# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advise do
    user_id 1
    category_id 1
    last_name "MyString"
    name "MyString"
    full_name "MyString"
    specialty "MyString"
    city "MyString"
    phone_number "MyString"
    description "MyString"
    status "MyString"
  end
end
