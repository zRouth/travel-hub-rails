FactoryGirl.define do
  factory :post do
    trip_account
    source "twitter"
    post_date Date.today
  end
end
