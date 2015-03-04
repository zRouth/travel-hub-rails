class Trip < ActiveRecord::Base
  belongs_to :user

  validates :name, :start_date, :end_date, :user, presence: true
end
