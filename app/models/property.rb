class Property < ActiveRecord::Base
  #Constants
  PURPOSES = %w[share rent]
  TYPES = %w[unit acreage townhouse terrace house]

  #Association
  belongs_to :post
  #Name Scope
end
