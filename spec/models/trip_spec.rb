require 'rails_helper'

RSpec.describe Trip, :type => :model do
  it "is invalid without a start date, end date, name and user" do
    trip = build(:trip, start_date: nil, end_date: nil, name: nil, user: nil)
    expect(trip).to_not be_valid
  end

  it "can return a serialized array of posts" do
    user = create(:user)
    trip = create(:trip,
                 start_date: Date.today,
                 end_date: Date.today.next_day,
                 name: "my trip",
                 user: user)
    bob  = create(:trip_account, username: "bob", trip: trip)
    post = create(:post, text: "bob's post", trip_account: bob)

    trip.posts.each do |post|
      expect(post.class).to eq PostSerializer
    end
  end
end
