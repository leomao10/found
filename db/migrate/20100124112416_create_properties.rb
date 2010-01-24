class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :number_of_bedrooms
      t.integer :number_of_carparks
      t.integer :number_of_bathrooms
      t.float :price
      t.float :bond
      t.integer :max_tenants
      t.integer :number_of_current_tenants
      t.boolean :furnished
      t.string :purpose
      t.string :type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :properties
  end
end
