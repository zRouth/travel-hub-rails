require 'rails_helper'

RSpec.describe Trip, :type => :model do
  it "is invalid without a start date, end date, name and user" do
    trip = build(:trip, start_date: nil, end_date: nil, name: nil, user: nil)
    expect(trip).to_not be_valid
  end
end
