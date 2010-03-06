class Property < ActiveRecord::Base
  #Constants
  PURPOSES = %w[share rent]
  TYPES = %w[unit acreage townhouse terrace house]

  #Association
  has_one :post, :as => :postable
  #Name Scope
end
