class Address < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :line1, :line2

  #Association
  belongs_to :suburb
  helongs_to :addressable, :polymorphic => true
end
