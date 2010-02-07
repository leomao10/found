class Suburb < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :name, :area, :state, :postcode

  #Association
  has_many :addresses

  Suburb.alias_scope :keyword_has, lambda { |keyword| name_or_area_or_state_or_postcode_like(keyword)}
end
