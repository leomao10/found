class AddUserReferenceToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.references :user
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :user_id
    end
  end
end
