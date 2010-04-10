class Suburb < ActiveRecord::Base
  STATES = %w[NSW QLD ACT]

  acts_as_mappable
  
  #Attribute accessiblity
  attr_accessible :name, :area, :state, :postcode, :country

  #Association
  has_many :addresses

  #Named Scope
  named_scope :distance, lambda { |loc, distance|
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(loc, :bias => :au)
    { :conditions => ["#{Suburb.distance_sql(geo)} < #{distance}"] }
  }
  
  Suburb.alias_scope :keyword_has, lambda { |keyword| name_or_area_or_state_or_postcode_like(keyword)}
  
  #Validation
  before_validation :geocode_address

  #Virtual Property
  def country
    "Australia"
  end

  def to_s(format = "")
    return [name].reject{|s| s.blank?}.join(",") if(format == :short)
    return [name,state,country,postcode].reject{|s| s.blank?}.join(",")    
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::GoogleGeocoder.geocode(self.to_s)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
