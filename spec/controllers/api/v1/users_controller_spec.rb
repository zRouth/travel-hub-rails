require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  #{
  #"id": 1,
  #"twitter_username": "IamSomewhatC00l",
  #"insta_name": "IamSomewhatC00l2",
  #"email": "IamSomewhat@example.com",
  #"first_name": "Pat",
  #"last_name": "Mee",
  #"password_digest": "thisisapassword",
  #"groups": [1],
  #"trips": [1]
#},

 it "fetches_a_single_user" do
    user = User.create(twitter_username: "worace",
                       instagram_username: "worace",
                       name: "worace",
                       email: "worace@gmail.com")
    g = Trip.create(name: "turing skiers")
    t = Trip.create(name: "gnar shredding")
    user.trips << t
    user.trips << g

    get :show, id: user.id
    data = JSON.parse(@response.body)
    expect(data.keys).to eq ["user"]
    # user_data = data["user"]
    # expect(user_data["twitter_username"]).to eq "worace"
    # expect(user_data["trips"]).to eq [g.id]
    # expect(user_data["trips"]).to eq [t.id]
  end

  it "fetches an index" do
    user = User.create(twitter_username: "worace",
                       instagram_username: "worace",
                       name: "worace",
                       email: "worace@gmail.com")
    g = Trip.create(name: "turing skiers")
    t = Trip.create(name: "gnar shredding")
    user.trips << t
    user.trips << g

    User.create(twitter_username: "patmee", instagram_username: "patmee", last_name: "mee")

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
