class Suburb < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :name, :area, :state, :postcode

  #Association
  has_many :addresses
end
