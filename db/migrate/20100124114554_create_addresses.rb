class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.references :addressable, :polymorphic => true
      t.references :suburb
      t.timestamps
    end
  end
  
  def self.down
    drop_table :addresses
  end
end
