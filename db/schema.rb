# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100416183702) do

  create_table "addresses", :force => true do |t|
    t.integer  "post_id"
    t.string   "building_name"
    t.string   "suite_unit"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "town"
    t.string   "state"
    t.string   "country"
    t.integer  "postcode"
    t.decimal  "lat",           :precision => 15, :scale => 10
    t.decimal  "lng",           :precision => 15, :scale => 10
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carparks", :force => true do |t|
    t.float    "price"
    t.float    "bond"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.boolean  "is_main"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "available_from"
    t.date     "expiry_date"
    t.string   "inspection_time"
    t.boolean  "negotiable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "properties", :force => true do |t|
    t.integer  "number_of_bedrooms"
    t.integer  "number_of_carparks"
    t.integer  "number_of_bathrooms"
    t.float    "price"
    t.float    "bond"
    t.integer  "max_tenants"
    t.integer  "number_of_current_tenants"
    t.boolean  "furnished"
    t.string   "purpose"
    t.string   "prop_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "property_searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "min_price"
    t.integer  "max_price"
    t.string   "property_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_of_bathrooms"
    t.integer  "max_of_bathrooms"
    t.integer  "min_of_bedrooms"
    t.integer  "max_of_bedrooms"
    t.integer  "min_of_carparks"
    t.integer  "max_of_carparks"
    t.integer  "search_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",  :default => "", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
