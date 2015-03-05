class TripsSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :start_date,
             :end_date,
             :user_id
end
