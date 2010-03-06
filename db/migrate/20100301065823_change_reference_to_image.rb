class ChangeReferenceToImage < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.remove :imagable_id, :imagable_type
      t.references :post
    end
  end

  def self.down
    change_table :images do |t|
      t.references :imagable, :polymorphic => true
      t.remove :post_id
    end
  end
end
