class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime  :postdate
      t.string    :source
      t.string    :text
      t.string    :imageUrl
      t.string    :thumbnailUrl
      t.string    :locationName
      t.string    :latitude
      t.string    :longitude
      t.string    :link
      t.integer   :likes

      t.timestamps
    end
  end
end
