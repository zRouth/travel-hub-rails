require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "is invalid without a source and post date" do
    post = build(:post, source: nil, post_date: nil)
    expect(post).not_to be_valid
  end
end
