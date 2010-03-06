class Carpark < ActiveRecord::Base
  #Constant
  TYPE = %w[secure outdoor]

  #Attribute accessiblity
  attr_accessible :price, :bond, :type

  #Association
  has_one :post, :as => :postable
end
