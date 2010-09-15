class SuburbsController < ApplicationController
  def new
  end

  def create

  end

  def edit
    
  end

  def search
    @keyword,@limit = params[:keyword],params[:limit]
    @suburbs = Suburb.name_like(@keyword).paginate(:page=> 1, :per_page => @limit)
    render :json => @suburbs.to_json
  end
end
