class AddressesController < ApplicationController
  before_filter :get_post
    
  def show
    @post.address
  end
  
  def create
    @address = Address.new(params[:address])

    if @address.save
      @post.address = @address
      flash[:notice] = "Successfully created address."
    else
      flash[:notice] = "Fail to create address."
    end

    respond_to do |f|
      f.js
    end
  end
  
  def get_post
    @post = Post.find(params[:post_id])
  end
end
