class PropertySearch < ActiveRecord::Base
  def properties
    @properties ||= search
  end

  def search
    Property.search(
      :price_gte => min_price,
      :price_lte => max_price,
      :number_of_bedrooms_gte => min_of_bedrooms,
      :number_of_bedrooms_lte => max_of_bedrooms,
      :number_of_bathrooms_gte => min_of_bathrooms,
      :number_of_bathrooms_lte => max_of_bathrooms,
      :number_of_carparks_gte => min_of_carparks,
      :number_of_carparks_lte => max_of_carparks,
      :prop_type_eq => property_type
    )
  end
end
