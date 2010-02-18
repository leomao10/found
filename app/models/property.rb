class Property < ActiveRecord::Base
  #Constants
  PURPOSES = %w[share rent]
  TYPES = %w[unit acreage townhouse terrace house]

  #Association
  has_one :post, :as => :postable
  has_many :images, :as => :imagable
  #Name Scope
end
