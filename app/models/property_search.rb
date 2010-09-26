class PropertySearch < ActiveRecord::Base
  def properties
    @properties = search.all
  end

  def search  
    Property.
      where(:price.gte => min_price.nil? ? "" : min_price).
      where(:price.lte => max_price.nil? ? "" : max_price).
      where(:number_of_bedrooms.gte => min_of_bedrooms.nil? ? "" : min_of_bedrooms).
      where(:number_of_bedrooms.lte => max_of_bedrooms.nil? ? "" : max_of_bedrooms).
      where(:number_of_bathrooms.gte => min_of_bathrooms.nil? ? "" : min_of_bathrooms).
      where(:number_of_bathrooms.lte => max_of_bathrooms.nil? ? "" : max_of_bathrooms).
      where(:number_of_carparks.gte => min_of_carparks.nil? ? "" : min_of_carparks).
      where(:number_of_carparks.lte => max_of_carparks.nil? ? "" : max_of_carparks).
      where(:prop_type.eq => property_type.nil? ? "" : property_type)
  end
end
