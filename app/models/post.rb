class Post < ActiveRecord::Base
  belongs_to :trip_account

  validates :source, :post_date, presence: true
end
