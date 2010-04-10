include
class Address < ActiveRecord::Base
  #Attribute accessiblity
  attr_accessible :line1, :line2, :suburb

  acts_as_mappable
  
  #Association
  belongs_to :post
  belongs_to :suburb

  before_validation :geocode_address

  def full_address
    [line1,line2,suburb].reject{|s| s.blank?}.join(",")
  end

  def to_s
    [line1,line2,suburb].reject{|s| s.blank?}.join(",")
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::GoogleGeocoder.geocode(full_address, :bias => :au)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
