class Address < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :line1, :line2, :suburb

  #Association
  belongs_to :post
  belongs_to :suburb

  def to_s
    [line1,line2,suburb.name,suburb.state].join(",")
  end
end
