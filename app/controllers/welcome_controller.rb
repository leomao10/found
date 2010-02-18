class WelcomeController < ApplicationController
  def index
    redirect_to :controller => "searches", :action => "new"
  end
end
