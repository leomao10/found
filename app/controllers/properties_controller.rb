class PropertiesController < ApplicationController
  before_filter :get_post

  def show
    @post.property
  end

  def create
    @property = Property.new(params[:property])

    if @property.save
      @post.property = @property
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
