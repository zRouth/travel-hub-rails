class AddTripsToUser < ActiveRecord::Migration
  def change
    add_reference :trips, :user, index: true
  end
end
