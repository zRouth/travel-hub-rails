class PostFetcher
  attr_reader :start_date, :end_date, :usernames, :source, :queue

  @queue = :post_fetcher

  def initialize(start_date, end_date, source, usernames)
    @start_date = start_date
    @end_date   = end_date
    @source     = source
    @usernames  = usernames
  end

  def perform
    usernames.flat_map do |username|
      fetch_posts(start_date, end_date, source, username)
    end
  end

  def self.perform(start_date, end_date, source, usernames)
    new(start_date, end_date, source, usernames).perform
  end

  private

  def fetch_posts(start_date, end_date, source, username)
    case source
    when "twitter"
      tweets = TwitterService.get_tweets_in_range(username, start_date, end_date)
      return TweetParser.parse(tweets)
    when "instagram"
      media  = InstagramService.get_user_media(username, start_date, end_date)
      return InstagramParser.parse(media)
    end
  end
end
