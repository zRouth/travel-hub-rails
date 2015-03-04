require 'date'

class InstagramParser
  attr_reader :media

  def initialize(media)
    @media = media
  end

  def parse
    media.map do |media|
      post = Post.where(link: media["link"]).first_or_create

      post.post_date      = Date.strptime(media["created_time"], "%s")
      post.source         = "instagram"
      post.text           = media["caption"]["text"]
      post.image_url      = media["images"]["standard_resolution"]["url"]
      post.thumbnail_url  = media["images"]["thumbnail"]["url"]
      post.link           = media["link"]
      post.save!
      post
    end
  end

  def self.parse(media)
    new(media).parse
  end
end
