FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    password "password"
    sequence(:email) { |n| "#{name}#{n}@example.com"  }
  end
end

