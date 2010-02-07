class CreatePropertySearches < ActiveRecord::Migration
  def self.up
    create_table :property_searches do |t|
      t.string :keywords
      t.integer :min_price
      t.integer :max_price
      t.integer :num_of_bedrooms
      t.integer :num_of_bathrooms
      t.integer :num_of_carparks
      t.string :property_type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :property_searches
  end
end
