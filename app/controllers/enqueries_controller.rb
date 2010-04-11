class EnqueriesController < ApplicationController
  before_filter :get_post
  def create
    @enquery = Enquery.new(@post)
    puts params[:enquery][:name]
#    @enquery.name = params[:enqeury][:name]
#    @enquery.email = params[:enquery][:email]
#    @enquery.phone = params[:enquery][:phone]
#    @enquery.content = params[:enquery][:content]

    @enquery.deliver_enquery!
    flash[:notice] = "You already sent an enquery to landlord."
    redirect_to :back
  end
  
  private
  def get_post
    @post = Post.find(params[:post_id])
  end
end
