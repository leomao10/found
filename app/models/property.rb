class Property < ActiveRecord::Base
  #Constants
  PURPOSE = %w[share rent]
  TYPE = %w[unit acreage townhouse terrace house]

  #Association
  has_one :post, :as => :postable
  has_one :address, :as => :addressable
  has_many :images, :as => :imagable
  #Name Scope
end
