class PostsController < ApplicationController
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 1
  end
  
  def show
    unless session[:search].nil?
      @search  = Search.new(session[:search])
    else
      @search ||= Search.new
    end
    @post = Post.find(params[:id])
    render :template => 'posts/show', :locals => { :search => @search, :post => @post }
  end
  
  def new
    @post = Post.setup
    @address = Address.new
    render :template => 'posts/new', :locals => { :post => @post }
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
