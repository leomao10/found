class PropertySearchesController < ApplicationController
  def create
    @search = PropertySearch.new(params[:property_search])
    session[:property_search] = @search
    redirect_to :action => "show"
  end

  def show
    if session[:property_search]
      @search  = session[:property_search]
    else
      @search ||= PropertySearch.new
    end
    
    @posts = @search.posts
  end
end
