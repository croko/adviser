# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name 'Оператор'
    nickname 'operator'
  end

  factory :role_admin, parent: :role do
    name 'Администратор'
    nickname 'admin'
  end

  factory :invalid_role, parent: :role do
    name nil
    nickname nil
  end

end
