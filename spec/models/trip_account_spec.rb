require 'rails_helper'

RSpec.describe TripAccount, :type => :model do
  it "is invalid without a username, source and trip" do
    trip_account = build(:trip_account, username: nil, source: nil, trip: nil)
    expect(trip_account).not_to be_valid
  end
end
