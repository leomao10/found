class Suburb < ActiveRecord::Base
  STATES = %w[NSW QLD ACT]

  acts_as_mappable
  
  #Attribute accessiblity
  attr_accessible :name, :area, :state, :postcode, :country

  #Association
  has_many :addresses
  
  #Validation
  before_validation :geocode_address

  Suburb.alias_scope :has_keyword, lambda { |keyword| name_or_postcode_begins_with(keyword)}

  private
  def geocode_address
    geo=Geokit::Geocoders::GoogleGeocoder.geocode(self.to_s)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
