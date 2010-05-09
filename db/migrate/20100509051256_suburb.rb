class Suburb < ActiveRecord::Migration
  def self.up
    create_table :suburbs do |t|
      t.string :name
      t.string :state
      t.integer :postcode
      t.timestamps
    end
  end

  def self.down
    drop_table :suburbs
  end
end
