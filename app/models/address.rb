class Address < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :building_name,:suite_unit,:street_number, :street_name, :town, :state, :country, :postcode

  acts_as_mappable
  
  #Association
  belongs_to :post
  belongs_to :suburb

  #Named Scope
  scope :distance, lambda { |loc, distance|
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(loc, :bias => :au)
    { :conditions => ["#{Address.distance_sql(geo)} < #{distance}"] }
  }

  scope :contain_keyword, lambda { |keyword| where("addresses.town like :keyword or addresses.state like :keyword or addresses.postcode like :keyword",{:keyword =>keyword})}

  before_validation :geocode_address

  def country
    "Australia"
  end

  def to_s(format = "")
    return [street_number,street_name, town].reject{|s| s.blank?}.join(",") if(format == :short)
    return [building_name,suite_unit,street_number,street_name, town, state, country, postcode].reject{|s| s.blank?}.join(",")
  end
  
  private
  def geocode_address
    geo=Geokit::Geocoders::GoogleGeocoder.geocode(self.to_s, :bias => :au)
    errors.add(:address, "Could not Geocode address") if !geo.success
    if geo.success
      self.lat, self.lng = geo.lat,geo.lng 
      self.town = geo.city
      self.state = geo.state
    end
  end
end