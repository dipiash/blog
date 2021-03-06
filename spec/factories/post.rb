FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n} <truncate_text> lorem ipsum jdfslgjfdgkl" }
    sequence(:tag_list) { |n| "tag#{n}, tag#{n+1}, tag#{n+2}"}
    sequence(:created_at) { Time.now }
    sequence(:updated_at) { Time.now }
  end
end
