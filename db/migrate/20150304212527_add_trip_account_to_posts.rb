class AddTripAccountToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :trip_account, index: true
  end
end
