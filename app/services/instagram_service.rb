require "faraday"
require "json"

class InstagramService
  attr_reader :token, :username, :start_date, :end_date

  def initialize(username, start_date, end_date)
    @username   = username
    @start_date = to_unix(start_date)
    @end_date   = to_unix(end_date)
    @token = Rails.application.secrets.instagram_token
  end


  def get_user_media
    user_id = get_user_id(username)
    media   = fetch_media_in_range(user_id, start_date, end_date)
  end

  def self.get_user_media(username, start_date, end_date)
    new(username, start_date, end_date).get_user_media
  end

  private

  def search_users(username)
    url = "https://api.instagram.com/v1/users/search?q=#{username}&client_id=#{token}"
    response = Faraday.new(url).get.body
    JSON.parse(response)["data"]
  end

  def fetch_media_in_range(user_id, start_date, end_date)
    url = "https://api.instagram.com/v1/users/#{user_id}/media/recent/?max_timestamp=#{end_date}&min_timestamp=#{start_date}&client_id=#{token}"
    response = Faraday.new(url).get.body
    JSON.parse(response)["data"]
  end

  def get_user_id(username)
    response = search_users(username)
    user = response.find { |data| data["username"] == username }
    user["id"]
  end

  def to_unix(date)
    date.to_time.to_i
  end
end
