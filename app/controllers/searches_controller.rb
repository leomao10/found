class SearchesController < ApplicationController
  
  def index
    @searches = Search.all
  end
  
  def edit
    @search = Search.find(params[:id])
  end
  
  def update
    @search = Search.find(params[:id])
    if @search.update_attributes(params[:search])
      flash[:notice] = "Successfully updated search."
      redirect_to searches_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @search = Search.find(params[:id])
    @search.destroy
    flash[:notice] = "Successfully destroyed search."
    redirect_to searches_url
  end
end
