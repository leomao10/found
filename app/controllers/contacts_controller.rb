class ContactsController < ApplicationController
  before_filter :get_post

  def show
    @post.contact
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      @post.contact = @contact
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
