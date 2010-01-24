class CreateCarparks < ActiveRecord::Migration
  def self.up
    create_table :carparks do |t|
      t.float :price
      t.float :bond
      t.string :type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :carparks
  end
end
