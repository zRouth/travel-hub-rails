class TripSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id,
             :name,
             :start_date,
             :end_date

  has_one :user
  has_many :posts
end
