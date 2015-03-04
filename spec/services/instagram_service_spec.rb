require 'pry'
require 'rails_helper'

describe InstagramService do

  it "makes posts out of tweets" do
    VCR.use_cassette "instagram-service" do
      Timecop.freeze(Time.local(2015, 3, 1)) do
        username = "treysongz"
        media = InstagramService.get_user_media(username, Date.today.prev_day, Date.today)
        fangirls = media.last["comments"]["count"]

        expect(media.count).to eq(3)
        expect(media.first["user"]["username"]).to eq(username)
        expect(fangirls).to eq(333)
      end
    end
  end
end
