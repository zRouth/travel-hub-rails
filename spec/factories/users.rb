FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) { |n| "#{name}#{n}@example.com"  }
  end
end

