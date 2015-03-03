require 'twitter'
require 'figaro'

class TwitterService
  attr_reader :user, :start_date, :end_date

  def initialize(user, start_date, end_date)
    @user       = user
    @end_date   = end_date
    @start_date = start_date
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_key
      config.consumer_secret     = Rails.application.secrets.twitter_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_secret
    end
  end

  def self.get_tweets_in_range(user, start_date, end_date)
    new(user, start_date, end_date).get_tweets_in_range
  end

  def get_tweets_in_range
    client.user_timeline(user, count: 199).select do |tweet|
      tweet.created_at >= start_date && tweet.created_at <= end_date
    end
  end
end
