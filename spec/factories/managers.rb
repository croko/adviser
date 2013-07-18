# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manager, parent: :user, class: 'Manager' do
    category nil
  end
end
