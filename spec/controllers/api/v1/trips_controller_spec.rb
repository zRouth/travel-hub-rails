require 'rails_helper'

RSpec.describe Api::V1::TripsController, :type => :controller do
  it "fetches a trip" do
    user = create(:user)
    trip = create(:trip, start_date: Date.new(2015, 5, 13), end_date: Date.new(2015, 5, 18), user: user)
    sign_in user

    get :show, id: trip.id
    trip_data = JSON.parse(@response.body)
    expect(trip_data["trip"]["start_date"]).to eq("2015-05-13T00:00:00.000Z")
  end

  it "fetches an index" do
    user  = create(:user)
    trip1 = create(:trip, name: "Worace's Awesome Trip", user: user)
    trip2 = create(:trip, name: "Alex's Awesome Trip", user: user)
    sign_in user

    get :index
    trips_data = JSON.parse(@response.body)
    expect(trips_data["trips"].length).to eq(2)
    expect(trips_data["trips"].first["name"]).to eq("Worace's Awesome Trip")
    expect(trips_data["trips"].last["name"]).to eq("Alex's Awesome Trip")
  end

  it "creates a trip" do
    user  = create(:user)
    sign_in user
    post(:create, trip: { name: "My Awesome Trip", start_date: Date.new(2015, 5, 13), end_date: Date.new(2015, 5, 18) })

    trip_data = JSON.parse(@response.body)
    expect(trip_data["trip"]["name"]).to eq("My Awesome Trip")
  end

  it "updates a trip" do
    user  = create(:user)
    sign_in user
    trip = create(:trip)
    put(:update, id: trip.id, trip: { name: "My Awesome Trip" })

    trip_data = JSON.parse(@response.body)
    expect(trip_data["trip"]["name"]).to eq("My Awesome Trip")
  end

  it "deletes a trip" do
    user  = create(:user)
    sign_in user
    trip = create(:trip)
    delete(:destroy, id: trip.id)
    expect(Trip.last).not_to eq(trip)
  end
end
