require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  it "fetches a single user" do
    user = User.create(twitter_username: "worace",
                       instagram_username: "worace",
                       name: "worace",
                       email: "worace@example.com")

    get :show, id: user.id
    user_data = JSON.parse(@response.body)
    expect(user_data["name"]).to eq("worace")
    expect(user_data["email"]).to eq("worace@example.com")
  end

  it "fetches an index" do
    user = User.create(twitter_username: "worace",
                       instagram_username: "worace",
                       name: "worace",
                       email: "worace@gmail.com")

    User.create(twitter_username: "patmee", instagram_username: "patmee", name: "mee")

    get :index
    data = JSON.parse(@response.body)
    assert_equal Hash, data.class
    assert_equal ["users"], data.keys
    assert_equal Array, data["users"].class
  end

  it "fetches a batch of users on the index" do
    User.create(twitter_username: "worace", instagram_username: "worace", name: "worace", email: "worace@gmail.com")
    u2 = User.create(twitter_username: "torta", instagram_username: "torta", name: "herbs", email: "torta@gmail.com")
    u3 = User.create(twitter_username: "zrouth", instagram_username: "zrouth", name: "zach", email: "zrouth@gmail.com")

    get :index, ids: [u2.id, u3.id]
    data = JSON.parse(@response.body)
    assert [u2.id, u3.id], data["users"].map { |u| u["id"] }
  end
end
