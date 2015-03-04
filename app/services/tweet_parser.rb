class TweetParser
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def self.parse(tweets)
    new(tweets).parse
  end

  def parse
    tweets.map do |tweet|
      post = Post.where(link: full_link(tweet.uri)).first_or_create
      post.post_date = tweet.created_at
      post.source   = "twitter"
      post.text     = tweet.full_text
      post.image_url = set_media(tweet)
      post.save!
      post
    end
  end

  def set_media(tweet)
    unless tweet.media.empty?
      wanted_tweet = tweet.media.find do |media|
        media.class == Twitter::Media::Photo || Twitter::Media::AnimatedGif
      end

      full_link(wanted_tweet.url)
    end
  end

  def full_link(uri)
    uri.origin + uri.path
  end
end
