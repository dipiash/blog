FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password '00000000'

    trait :is_admin do
      role 'admin'
    end
  end
end
