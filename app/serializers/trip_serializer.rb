class TripSerializer < ActiveModel::Serializer
  has_one :user, serializer: UserSerializer

  attributes :name,
             :start_date,
             :end_date,
             :posts
end
