class ChangeColumnsOfPropertySearch < ActiveRecord::Migration
  def self.up
    change_table :property_searches do |t|
      t.integer :min_of_bathrooms, :max_of_bathrooms
      t.integer :min_of_bedrooms, :max_of_bedrooms
      t.integer :min_of_carparks, :max_of_carparks
      t.remove :num_of_bathrooms, :num_of_bedrooms, :num_of_carparks
    end
  end

  def self.down
      t.remove :min_of_bathrooms, :max_of_bathrooms
      t.remove :min_of_bedrooms, :max_of_bedrooms
      t.remove :min_of_carparks, :max_of_carparks
      t.integer :num_of_bathrooms, :num_of_bedrooms, :num_of_carparks    
  end
end
