class Post < ActiveRecord::Base
  has_one :address
  has_many :images
  
  belongs_to :postable, :polymorphic => true
end
