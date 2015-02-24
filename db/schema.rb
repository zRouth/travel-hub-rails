ActiveRecord::Schema.define(version: 20150224195907) do

  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.datetime "postdate"
    t.string   "source"
    t.string   "text"
    t.string   "imageUrl"
    t.string   "thumbnailUrl"
    t.string   "locationName"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "link"
    t.integer  "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "instagram_username"
    t.string   "twitter_username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
