class TripAccount < ActiveRecord::Base
  has_many :posts
  belongs_to :trip

  validates :username, :source, :trip, presence: true

  def self.assign_trip_accounts(trip_accounts_hash, trip)
    self._create_twitter_accounts(trip_accounts_hash["twitter_accounts"], trip)
    self._create_instagram_accounts(trip_accounts_hash["instagram_accounts"], trip)
  end

  def self._create_twitter_accounts(twitter_usernames, trip)
    if twitter_usernames
      usernames = twitter_usernames.split(",")
      usernames.each { |username| TripAccount.create!(username: username, source: "twitter", trip: trip) }
    end
  end

  def self._create_instagram_accounts(instagram_usernames, trip)
    if instagram_usernames
      usernames = instagram_usernames.split(",")
      usernames.each { |username| TripAccount.create!(username: username, source: "instagram", trip: trip) }
    end
  end
end
