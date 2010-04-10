class AddressesController < ApplicationController
 # before_filter :get_post
  def index
    @addresses = Address.all
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(params[:address])
    if @address.save
      flash[:notice] = "Successfully created address."
      respond_to do |f|
        f.js
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @address = @post.address
  end
  
  def update
    @address = @post.address
    if @address.update_attributes(params[:address])
      flash[:notice] = "Successfully updated address."
      respond_to do |f|
        f.js
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @address = @post.address
    @address.destroy
    flash[:notice] = "Successfully destroyed address."
    redirect_to addresses_url
  end

  def get_post
    @post = Post.find(params[:post_id])
  end
end
