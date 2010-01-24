class AddNameToSuburb < ActiveRecord::Migration
  def self.up
    change_table :suburbs do |t|
      t.string :name
    end
  end

  def self.down
    change_table :suburbs do |t|
      t.remove :name
    end
  end
end
