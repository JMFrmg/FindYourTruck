class HomeController < ApplicationController
  def index
  	@foodtruckers = Foodtrucker.all
  end
end
