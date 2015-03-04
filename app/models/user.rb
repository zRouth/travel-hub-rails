class User < ActiveRecord::Base
  has_many :trips

  validates :name, :email, presence: true
end
