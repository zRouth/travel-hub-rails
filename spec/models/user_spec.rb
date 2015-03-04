require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is invalid without a name and email" do
    user = build(:user, name: nil, email: nil)
    expect(user).to_not be_valid
  end
end
