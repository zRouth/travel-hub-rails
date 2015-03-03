require 'pry'
require 'rails_helper'

describe TweetParser do

  it "makes posts out of tweets" do
    VCR.use_cassette "tweet_parser" do
      Timecop.freeze(Time.local(2015, 3, 2)) do
        tweets = TwitterService.get_tweets_in_range("@j3", Date.today.prev_day, Date.today)
        response = TweetParser.parse(tweets)

        response.each do |post|
          expect(post.class).to eq(Post)
        end

        expect(response.first.text).to eq(tweets.first.text)
      end
    end
  end

  it "can set an image url" do
    VCR.use_cassette "tweet_parser_image" do
      Timecop.freeze(Time.local(2015, 3, 3)) do
        tweets = TwitterService.get_tweets_in_range("@_VikiAnn", Date.today.prev_day, DateTime.now)
        tweet = TweetParser.parse(tweets).first

        expect(tweet.imageUrl).to_not eq(nil)
      end
    end
  end
end
