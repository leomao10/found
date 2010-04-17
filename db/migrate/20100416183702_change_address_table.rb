class ChangeAddressTable < ActiveRecord::Migration
  def self.up
    drop_table :suburbs
    drop_table :addresses
    create_table :addresses, :force => true do |t|
      t.integer "post_id"
      t.string   "building_name"
      t.string   "suite_unit"
      t.string   "street_number"
      t.string   "street_name"
      t.string   "town"
      t.string   "state"
      t.string  "country"
      t.integer "postcode"
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.integer  "creator_id"
      t.integer  "updater_id"
      t.timestamps
    end
    
  end

  def self.down
    create_table "suburbs", :force => true do |t|
      t.string "area"
      t.string "state"
      t.integer "postcode"
      t.string  "name"
      t.float "lat"
      t.float "lng"
      t.datetime "created_at"
      t.datetime "updated_at"
    end


     drop_table :addresses

     create_table :addresses, :force => true do |t|
      t.integer "post_id"
      t.string   "line1"
      t.string   "line2"
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.timestamps
    end

  end
end
