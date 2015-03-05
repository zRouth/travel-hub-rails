class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_accounts

  validates :name, :start_date, :end_date, :user, presence: true

  def posts
    trip_accounts.flat_map do |trip_account|
      trip_account.posts.flat_map do |post|
        PostSerializer.new(post)
      end
    end
  end
end
