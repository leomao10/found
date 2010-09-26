class Search < ActiveRecord::Base
  has_one :property_search
  accepts_nested_attributes_for :property_search, :allow_destroy => true
  attr_accessible :keyword,:property_search

  def self.after_initialize
    build_property_search if property_search.nil?
  end

  def search_by_property
    properties = property_search.properties
    return [] if properties.empty?
    post_ids = properties.map{ |p|
      p.post_id
    }
    Post.id_eq_any(post_ids)
  end

  def search_address_like(arg)
    if(arg.nil? || arg.empty?)
      Post.all
    else
      Post.address_contain_keyword(arg)
    end
  end

  def posts
    @posts = (search_address_like(keyword) & search_by_property)
  end
end
