class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_accounts

  validates :name, :start_date, :end_date, :user, presence: true
end
