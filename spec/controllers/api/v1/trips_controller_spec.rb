require 'rails_helper'

RSpec.describe Api::V1::TripsController, :type => :controller do
  it "fetches a trip" do
    trip = create(:trip, start_date: Date.new(2015, 5, 13))

    get :show, id: trip.id
    trip_data = JSON.parse(@response.body)
    expect(trip_data["start_date"]).to eq("2015-05-13T00:00:00.000Z")
  end

  it "fetches an index" do
    trip1 = create(:trip, name: "Worace's Awesome Trip")
    trip2 = create(:trip, name: "Alex's Awesome Trip")

    get :index
    users_data = JSON.parse(@response.body)
    assert_equal 2, users_data.length
    assert_equal "Worace's Awesome Trip", users_data.first["name"]
    assert_equal "Alex's Awesome Trip", users_data.last["name"]
  end
end
