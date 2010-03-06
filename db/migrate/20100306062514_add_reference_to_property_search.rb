class AddReferenceToPropertySearch < ActiveRecord::Migration
  def self.up
    change_table :property_searches do |t|
      t.references :search
    end
  end

  def self.down
    change_table :property_searches do |t|
      t.remove :search_id
    end
  end
end
