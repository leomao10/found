class ChangeReferenceForAddress < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.remove :addressable_id, :addressable_type
    end
  end

  def self.down
    change_table :addresses do |t|
      t.reference :addressable, :polymorphic => true
    end
  end
end
