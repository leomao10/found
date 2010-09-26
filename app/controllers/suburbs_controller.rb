class SuburbsController < ApplicationController
  def new
  end

  def create

  end

  def edit
    
  end

  def search
    @keyword = params[:keyword]
    @limit = params[:limit]
    @suburbs = Suburb.has_name_like(@keyword).paginate(:page=> 1, :per_page => @limit)
    render :json => @suburbs.to_json
  end
end
