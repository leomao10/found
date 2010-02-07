class WelcomeController < ApplicationController
  def index
    @search = PropertySearch.new
  end
end
