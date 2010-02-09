class PropertySearch < ActiveRecord::Base
  def posts
    @posts ||= advance_search
  end

  #TODO abtract method to Post
  def advance_search
    properties = Property.search(
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
    property_ids = properties.each do |p|
      p.id
    end

    base_search(keywords).postable_type_eq("Property").postable_id_in(property_ids)
  end

  def base_search(arg)
    property_post = Post.postable_type_eq("Property")
    if(arg.nil? || arg.empty?)
      property_post
    else
      property_post.postable_property_type_address_suburb_keyword_has(arg)
    end
  end
end
