class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.date :available_from
      t.date :expiry_date
      t.string :inspection_time
      t.boolean :negotiable
      t.references :postable, :polymorphic => true
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
