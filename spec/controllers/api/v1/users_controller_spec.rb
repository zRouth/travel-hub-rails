require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  it "fetches a single user" do
    user = create(:user, name: "worace", email: "worace@example.com")

    get :show, id: user.id
    user_data = JSON.parse(@response.body)
    expect(user_data["name"]).to eq("worace")
    expect(user_data["email"]).to eq("worace@example.com")
  end

  it "fetches an index" do
    user = create(:user, name: "worace", email: "worace@example.com")

    create(:user, name: "mee")

    get :index
    users_data = JSON.parse(@response.body)
    assert_equal ["users"], users_data.keys
    assert_equal 2, users_data["users"].length
    assert_equal "worace", users_data["users"].first["name"]
    assert_equal "mee", users_data["users"].last["name"]
  end

  it "fetches a specified batch of users on the index" do
    create(:user, name: "worace", email: "worace@example.com")
    torta  = create(:user, name: "herbs", email: "torta@example.com")
    zrouth = create(:user, name: "zach", email: "zrouth@example.com")

    get :index, ids: [torta.id, zrouth.id]
    data = JSON.parse(@response.body)
    assert_equal [torta.id, zrouth.id], data["users"].map { |u| u["id"] }
  end

  it "updates a user's info" do
    user = create(:user)

    put :update, id: user.id, user: {name: "Viki", email: "viki@example.com"}

    user_data = JSON.parse(@response.body)
    expect(user_data["name"]).to eq "Viki"
    expect(user_data["email"]).to eq "viki@example.com"
    expect(User.find(user.id).name). to eq "Viki"
  end
end
