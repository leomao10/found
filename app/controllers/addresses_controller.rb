class AddressesController < ApplicationController
  before_filter :get_post,  :except => [:postcode_check]
    
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

  def postcode_check
    @suburb, @postcode = params[:suburb], params[:postcode]
    @error_flag = Suburb.find(:all, :conditions => ["name=? AND postcode=?", @suburb, @postcode]).blank? ? true : false
     respond_to do |f|
      f.js
    end
  end

end
