
class Image < ActiveRecord::Base
  belongs_to :imagable, :polymorphic => true
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
