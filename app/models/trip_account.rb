class TripAccount < ActiveRecord::Base
  has_many :posts
  belongs_to :trip

  validates :username, :source, :trip, presence: true
end
