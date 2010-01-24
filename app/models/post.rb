class Post < ActiveRecord::Base
  attr_accessible :title, :description, :available_from, :expiry_date, :inspection_time, :negotiable

  belongs_to :postable, :polymorphic => true
end
