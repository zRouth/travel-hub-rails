require 'pry'
require 'rails_helper'

describe TwitterService do
  it "gives back tweet objects" do
    VCR.use_cassette "tweet_parser" do
      Timecop.freeze(Time.local(2015, 3, 2)) do
        tweets = TwitterService.get_tweets_in_range("@j3", Date.today.prev_day, DateTime.now)

        tweets.each { |tweet| expect(tweet.class).to eq(Twitter::Tweet) }
        expect(tweets.length).to eq(3)
      end
    end
  end
end
