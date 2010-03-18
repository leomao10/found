
class Image < ActiveRecord::Base
  belongs_to :imagable, :polymorphic => true
  has_attached_file :photo, :styles => { :medium => "400x300>", :thumb => "120x90>" }
end
