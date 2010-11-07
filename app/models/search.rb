class Search < ActiveRecord::Base
  has_one :property_search
  accepts_nested_attributes_for :property_search, :allow_destroy => true
  attr_accessor :keyword,:property_search

  #callback
  after_initialize :built_property_search

  def search_by_property
    Post.joins(:property).where(property_search.search)
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
  
  private 
  def built_property_search
    build_property_search if property_search.nil?
  end
end
