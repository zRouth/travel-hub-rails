class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_accounts

  validates :name, :start_date, :end_date, :user, presence: true

  def posts
    trip_accounts.flat_map do |trip_account|
      trip_account.posts.flat_map do |post|
        post
      end
    end
  end

  def twitter_names
    twitter_accounts = trip_accounts.select do |trip_account|
      trip_account.source == "twitter"
    end
    twitter_accounts.map(&:username)
  end

  def instagram_names
    instagram_accounts = trip_accounts.select do |trip_account|
      trip_account.source == "instagram"
    end
    twitter_accounts.map(&:username)
  end
end
