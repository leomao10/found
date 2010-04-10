class RemovePostableFromPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.remove :postable_id, :postable_type
    end
  end

  def self.down
    change_table :posts do |t|
      t.references :postable, :polymorphic => true
    end
  end
end
