class CreateTripAccounts < ActiveRecord::Migration
  def change
    create_table :trip_accounts do |t|
      t.string :user_name
      t.string :source
      t.integer :trip_id

      t.timestamps
    end
  end
end
