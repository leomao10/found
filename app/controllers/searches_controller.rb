class SearchesController < ApplicationController
  def new
    @search = Search.new
    @search.build_property_search
    render "welcome/index"
  end
  
  def create
    @search = Search.new(params[:search])
    session[:search] = @search
    redirect_to :action => "show"
  end

  def show
    if session[:search]
      @search  = session[:search]
    else
      @search ||= Search.new
      @search.build_property_search
    end
    @posts = @search.posts.paginate :page => params[:page], :per_page => 1
    render "welcome/index"
  end
end
