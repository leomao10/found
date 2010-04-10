class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:notice] = "Successfully created property."
      redirect_to @property
    else
      render :action => 'new'
    end
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      flash[:notice] = "Successfully updated property."
      redirect_to @property
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    flash[:notice] = "Successfully destroyed property."
    redirect_to properties_url
  end
end
