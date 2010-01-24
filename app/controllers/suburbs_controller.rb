class SuburbsController < ApplicationController
  def index
    @suburbs = Suburb.all
  end
  
  def show
    @suburb = Suburb.find(params[:id])
  end
  
  def new
    @suburb = Suburb.new
  end
  
  def create
    @suburb = Suburb.new(params[:suburb])
    if @suburb.save
      flash[:notice] = "Successfully created suburb."
      redirect_to @suburb
    else
      render :action => 'new'
    end
  end
  
  def edit
    @suburb = Suburb.find(params[:id])
  end
  
  def update
    @suburb = Suburb.find(params[:id])
    if @suburb.update_attributes(params[:suburb])
      flash[:notice] = "Successfully updated suburb."
      redirect_to @suburb
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @suburb = Suburb.find(params[:id])
    @suburb.destroy
    flash[:notice] = "Successfully destroyed suburb."
    redirect_to suburbs_url
  end
end
