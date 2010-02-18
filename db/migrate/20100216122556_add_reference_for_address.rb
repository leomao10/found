class AddReferenceForAddress < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.references :post
    end
  end

  def self.down
    change_table :addresses do |t|
      t.remove :post_id
    end
  end
end
