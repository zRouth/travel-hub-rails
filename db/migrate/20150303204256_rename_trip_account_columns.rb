class RenameTripAccountColumns < ActiveRecord::Migration
  def up
    rename_column :trip_accounts, :user_name, :username
  end

  def down
    rename_column :trip_accounts, :username, :user_name
  end
end
