# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    message "MyText"
    rating 1
    commentable_type "MyString"
    commentable_id 1
  end

  factory :comment_doctor, parent: :comment do
    commentable_type 'Doctor'
  end

  factory :comment_clinic, parent: :comment do
    commentable_type 'Clinic'
  end
end
