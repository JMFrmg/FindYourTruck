class HomeController < ApplicationController
  def index
  	@foodtruckers = Foodtrucker.all
  end

  def show
  end


end
