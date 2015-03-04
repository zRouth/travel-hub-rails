require 'rails_helper'

describe InstagramParser do

  it "makes posts out of instagram media" do
    VCR.use_cassette "instagram_parser" do
      Timecop.freeze(Time.local(2015, 3, 3)) do
        media = InstagramService.get_user_media("treysongz", Date.today.prev_day, Date.today)
        response = InstagramParser.parse(media)

        response.each do |post|
          expect(post.class).to eq(Post)
        end

        expect(response.first.text).to eq(media.first["caption"]["text"])
      end
    end
  end

  it "can set an image url" do
    VCR.use_cassette "instagram_parser_image_url" do
      Timecop.freeze(Time.local(2015, 3, 3)) do
        media = InstagramService.get_user_media("treysongz", Date.today.prev_day, Date.today)
        post = InstagramParser.parse(media).first

        expect(post.image_url).to_not eq(nil)
      end
    end
  end
end
