class CarparksController < ApplicationController
  def index
    @carparks = Carpark.all
  end
  
  def show
    @carpark = Carpark.find(params[:id])
  end
  
  def new
    @carpark = Carpark.new
  end
  
  def create
    @carpark = Carpark.new(params[:carpark])
    if @carpark.save
      flash[:notice] = "Successfully created carpark."
      redirect_to @carpark
    else
      render :action => 'new'
    end
  end
  
  def edit
    @carpark = Carpark.find(params[:id])
  end
  
  def update
    @carpark = Carpark.find(params[:id])
    if @carpark.update_attributes(params[:carpark])
      flash[:notice] = "Successfully updated carpark."
      redirect_to @carpark
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @carpark = Carpark.find(params[:id])
    @carpark.destroy
    flash[:notice] = "Successfully destroyed carpark."
    redirect_to carparks_url
  end
end
