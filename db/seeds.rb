require 'factory_girl_rails'

class Seed
  attr_reader :jeff, :jorge, :steve, :jeffs_trip, :jorges_trip, :steves_trip

  def initialize
    generate_users
    generate_trips
    generate_trip_accounts
  end

  def generate_users
    @jeff  = FactoryGirl.create(:user, name: "Jeff", email: "jeff@example.com", password: "password")
    @jorge = FactoryGirl.create(:user, name: "Jorge", email: "jorge@example.com", password: "password")
    @steve = FactoryGirl.create(:user, name: "Steve", email: "steve@example.com", password: "password")

    puts "Users generated"
  end

  def generate_trips
    @jeffs_trip  = FactoryGirl.create(:trip,
                          name: "Jeff's Exclusive Staff Getaway",
                          start_date: Date.current,
                          end_date: Date.current.advance(days: 5),
                          user: jeff)
    @jorges_trip = FactoryGirl.create(:trip,
                          name: "Jorge's Adventure",
                          start_date: Date.current.advance(days: 10),
                          end_date: Date.current.advance(days: 25),
                          user: jorge)
    @steves_trip = FactoryGirl.create(:trip,
                          name: "Steve's Escape",
                          start_date: Date.new(2015, 3, 2),
                          end_date: Date.new(2015, 3, 8),
                          user: steve)

    puts "Trips generated"
  end

  def generate_trip_accounts
    FactoryGirl.create(:trip_account, username: "@j3", source: "twitter", trip: jeffs_trip)
    FactoryGirl.create(:trip_account, username: "roselladegori", source: "instagram", trip: jeffs_trip)
    FactoryGirl.create(:trip_account, username: "@novohispano", source: "twitter", trip: jeffs_trip)
    FactoryGirl.create(:trip_account, username: "antonioamendola", source: "instagram", trip: jeffs_trip)
    FactoryGirl.create(:trip_account, username: "@stevekinney", source: "twitter", trip: jeffs_trip)

    FactoryGirl.create(:trip_account, username: "@awatkins", source: "twitter", trip: jorges_trip)
    FactoryGirl.create(:trip_account, username: "roselladegori", source: "instagram", trip: jorges_trip)
    FactoryGirl.create(:trip_account, username: "@novohispano", source: "twitter", trip: jorges_trip)
    FactoryGirl.create(:trip_account, username: "@Will_Faurot", source: "twitter", trip: jorges_trip)

    FactoryGirl.create(:trip_account, username: "@tomdale", source: "twitter", trip: steves_trip)
    FactoryGirl.create(:trip_account, username: "@stevekinney", source: "twitter", trip: steves_trip)
    FactoryGirl.create(:trip_account, username: "antonioamendola", source: "instagram", trip: steves_trip)
    FactoryGirl.create(:trip_account, username: "@wycats", source: "twitter", trip: steves_trip)

    puts "Trip accounts generated"
  end
end

Seed.new
