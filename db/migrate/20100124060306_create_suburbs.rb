class CreateSuburbs < ActiveRecord::Migration
  def self.up
    create_table :suburbs do |t|
      t.string :area
      t.string :state
      t.integer :postcode
      t.timestamps
    end
  end
  
  def self.down
    drop_table :suburbs
  end
end
