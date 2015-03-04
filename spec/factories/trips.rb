FactoryGirl.define do
  factory :trip do
    name "My Awesome Trip"
    start_date Date.today
    end_date Date.today.next_day
    user
  end
end
