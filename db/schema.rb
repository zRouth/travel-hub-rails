ActiveRecord::Schema.define(version: 20150303221050) do
  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.datetime "post_date"
    t.string   "source"
    t.string   "text"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.string   "location_name"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "link"
    t.integer  "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_accounts", force: true do |t|
    t.string   "username"
    t.string   "source"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "instagram_username"
    t.string   "twitter_username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
