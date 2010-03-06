class SearchesController < ApplicationController
  def new
    @search = Search.new
    @search.build_property_search
    render :template => "welcome/index", :locals  => { :search => @search }
  end
  
  def create
    session[:search] = params[:search]
    redirect_to :action => "show"
  end

  def show
    unless session[:search].nil?
      @search  = Search.new(session[:search])
    else
      @search ||= Search.new
      @search.build_property_search
    end
    @posts = @search.posts.paginate :page => params[:page], :per_page => 1
    render :template => "welcome/index", :locals => { :search => @search }
  end
end
