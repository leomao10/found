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

ActiveRecord::Schema.define(:version => 20100124115827) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.integer  "suburb_id"
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

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "available_from"
    t.date     "expiry_date"
    t.string   "inspection_time"
    t.boolean  "negotiable"
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suburbs", :force => true do |t|
    t.string   "area"
    t.string   "state"
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

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
