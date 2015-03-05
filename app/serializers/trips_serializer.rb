class TripsSerializer < ActiveModel::Serializer
  has_one :user, serializer: UserSerializer

  attributes :name,
             :start_date,
             :end_date
end
