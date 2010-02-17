class Search < ActiveRecord::Base
  has_one :property_search
  accepts_nested_attributes_for :property_search

  def search_by_property
    properties = property_search.properties
    property_ids = properties.each do |p|
      p.id
    end
    Post.postable_type_eq("Property").postable_id_in(property_ids)
  end

  def search_address_like(arg)
    if(arg.nil? || arg.empty?)
      Post.all
    else
      Post.address_suburb_keyword_has(arg)
    end
  end

  def posts
    @posts ||= (search_address_like(keyword) & search_by_property)
  end
end
