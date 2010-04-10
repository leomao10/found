class AddLatLngToAddress < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.float :lat, :lng
    end
  end

  def self.down
    change_table :addresses do |t|
      t.remove :lat, :lng
    end
  end
end
