class Post < ActiveRecord::Base
  has_one :address
  belongs_to :postable, :polymorphic => true
end
