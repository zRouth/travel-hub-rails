class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :instagram_username
      t.string :twitter_username

      t.timestamps
    end
  end
end
