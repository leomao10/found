class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :photo_file_name,:photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.references :imagable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
