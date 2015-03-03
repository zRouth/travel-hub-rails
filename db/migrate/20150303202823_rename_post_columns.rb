class RenamePostColumns < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :postdate, :post_date
      t.rename :imageUrl, :image_url
      t.rename :thumbnailUrl, :thumbnail_url
      t.rename :locationName, :location_name
    end
  end
end
