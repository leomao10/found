class Property < ActiveRecord::Base
  #Constants
  PURPOSE = %w[share rent]
  TYPE = %w[unit acreage townhouse terrace house]

  #Attribute accessiblity
  attr_accessible :number_of_bedrooms, :number_of_carparks, :number_of_bathrooms, :price, :bond, :max_tenants, :number_of_current_tenants, :furnished, :purpose, :type

  #Association
  has_one :post, :as => :postable
  has_one :address, :as => :addressable
end
