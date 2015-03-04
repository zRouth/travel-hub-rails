require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  it "fetches a single user" do
    user = create(:user, name: "worace", email: "worace@example.com")

    get :show, id: user.id
    user_data = JSON.parse(@response.body)
    expect(user_data["name"]).to eq("worace")
    expect(user_data["email"]).to eq("worace@example.com")
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
