require 'rails_helper'

RSpec.describe TripAccount, :type => :model do
  it "is invalid without a username, source and trip" do
    trip_account = build(:trip_account, username: nil, source: nil, trip: nil)
    expect(trip_account).not_to be_valid
  end

  it "can parse a hash into trip_accounts" do
    trip_accounts_hash = {
      "twitter_accounts"=>"@j3, @novohispano, @stevekinney",
      "instagram_accounts"=>"j3, novohispano, stevekinney"
    }
    trip = create(:trip)

    expect(TripAccount.count).to eq 0
    TripAccount.assign_trip_accounts(trip_accounts_hash, trip)
    expect(TripAccount.count).to eq 6
  end
end
