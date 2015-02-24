class Trip < ActiveRecord::Base
  has_many :users
end
