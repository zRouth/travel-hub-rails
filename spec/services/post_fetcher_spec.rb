require 'pry'
require 'rails_helper'

describe PostFetcher do

  it "fetches all posts from multiple users by source" do
    VCR.use_cassette "post_fetcher_job" do
      Timecop.freeze(Time.local(2015, 3, 2)) do
        usernames = ["@j3", "@novohispano","@stevekinney", "@awatkins"]
        PostFetcher.perform(Date.today.prev_day.prev_day, Date.today, "twitter", usernames)
      end
    end
  end
end
