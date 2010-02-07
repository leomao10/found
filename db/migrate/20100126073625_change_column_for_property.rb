class ChangeColumnForProperty < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.rename :type, :prop_type
    end
  end

  def self.down
    change_table :properties do |t|
      t.rename  :prop_type, :type
    end
  end
end
